# Khai báo các thư viện
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import (
    InputLayer, Conv2D, ReLU, MaxPooling2D,
    BatchNormalization, Flatten, Dense, Dropout
)

# Tensorflow là một framework học sâu, còn keras cung cấp các lớp để xây dựng mô hình CNN mà không phải tự lập trình
# từng phép nhân ma trận hay thuật toán lan truyền ngược

# ==========================================
# 1. TRAINING CONFIGURATION
# ==========================================

INPUT_SHAPE = (96, 96, 1) # Ảnh xám 96x96 , 1 kênh

BATCH_SIZE = 32 # Mỗi lô huấn luyện là 32 ảnh
EPOCHS = 80 # Huấn luyện tối đa 80 lượt qua tập training
LEARNING_RATE = 0.0003 # Tốc độ học ban đầu của optimizer Adam
SEED = 42 # Thiệt lập seed ngẫu nhiên để hỗ trợ tái lập kết quả

ENSURE_DETERMINISM = args.ensure_determinism

tf.random.set_seed(SEED)

# ==========================================
# 2. DATA AUGMENTATION
# ==========================================

augmentation = tf.keras.Sequential([
    tf.keras.layers.RandomRotation(
        factor=0.012,
        fill_mode='constant'
    ),
    tf.keras.layers.RandomTranslation(
        height_factor=0.03,
        width_factor=0.03,
        fill_mode='constant'
    )
])

def augment_batch(images, labels):
    images = tf.cast(images, tf.float32)

    images = augmentation(
        images, training=True
    )

    images = tf.image.random_brightness(
        images, max_delta=0.02
    )

    images = tf.image.random_contrast(
        images, lower=0.95, upper=1.05
    )

    images = tf.clip_by_value(
        images, 0.0, 1.0
    )

    return images, labels

if not ENSURE_DETERMINISM:
    train_dataset = train_dataset.shuffle(
        buffer_size=512,
        seed=SEED,
        reshuffle_each_iteration=True
    )

train_dataset = train_dataset.batch(
    BATCH_SIZE, drop_remainder=False
)

if not ENSURE_DETERMINISM:
    train_dataset = train_dataset.map(
        augment_batch,
        num_parallel_calls=tf.data.AUTOTUNE
    )

prefetch_policy = (
    1 if ENSURE_DETERMINISM
    else tf.data.AUTOTUNE
)

train_dataset = train_dataset.prefetch(
    prefetch_policy
)

validation_dataset = validation_dataset.batch(
    BATCH_SIZE, drop_remainder=False
).prefetch(prefetch_policy)

# ==========================================
# 3. CNN ARCHITECTURE
# ==========================================

regularizer = tf.keras.regularizers.l2(0.0001)

model = Sequential([

    InputLayer(
        input_shape=INPUT_SHAPE,
        name='x_input'
    ),

    # Conv1: FPGA acceleration target
    Conv2D(
        8, (3, 3),
        strides=(1, 1),
        padding='valid',
        activation=None,
        name='conv1'
    ),
    ReLU(name='relu1'),
    MaxPooling2D((2, 2), name='pool1'),

    # Conv2
    Conv2D(
        24, (3, 3),
        padding='same',
        activation=None,
        kernel_regularizer=regularizer,
        name='conv2'
    ),
    BatchNormalization(name='bn2'),
    ReLU(name='relu2'),
    MaxPooling2D((2, 2), name='pool2'),

    # Conv3
    Conv2D(
        48, (3, 3),
        padding='same',
        activation=None,
        kernel_regularizer=regularizer,
        name='conv3'
    ),
    BatchNormalization(name='bn3'),
    ReLU(name='relu3'),
    MaxPooling2D((2, 2), name='pool3'),

    # Conv4
    Conv2D(
        64, (3, 3),
        padding='same',
        activation=None,
        kernel_regularizer=regularizer,
        name='conv4'
    ),
    BatchNormalization(name='bn4'),
    ReLU(name='relu4'),
    MaxPooling2D((2, 2), name='pool4'),

    # Classifier
    Flatten(name='flatten'),

    Dense(
        64,
        activation='relu',
        kernel_regularizer=regularizer,
        name='dense1'
    ),

    Dropout(0.35, name='dropout1'),

    Dense(
        classes,
        activation='softmax',
        name='predictions'
    )
])

# ==========================================
# 4. CALLBACKS
# ==========================================

callbacks.append(
    BatchLoggerCallback(
        BATCH_SIZE,
        train_sample_count,
        epochs=EPOCHS,
        ensure_determinism=ENSURE_DETERMINISM
    )
)

callbacks.append(
    tf.keras.callbacks.ReduceLROnPlateau(
        monitor='val_loss',
        factor=0.5,
        patience=5,
        min_lr=0.00001,
        verbose=1
    )
)

callbacks.append(
    tf.keras.callbacks.EarlyStopping(
        monitor='val_loss',
        patience=16,
        restore_best_weights=True,
        verbose=1
    )
)

# ==========================================
# 5. COMPILE
# ==========================================

model.compile(
    optimizer=tf.keras.optimizers.Adam(
        learning_rate=LEARNING_RATE
    ),
    loss='categorical_crossentropy',
    metrics=['accuracy']
)

model.summary()

# ==========================================
# 6. TRAIN
# ==========================================

history = model.fit(
    train_dataset,
    validation_data=validation_dataset,
    epochs=EPOCHS,
    callbacks=callbacks,
    verbose=2
)

print("Tiny CNN V5 training completed.")
