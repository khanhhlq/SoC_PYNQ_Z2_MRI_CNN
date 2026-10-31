# 2026-10-31T00:46:34.500800900
import vitis

client = vitis.create_client()
client.set_workspace(path="Source")

comp = client.create_hls_component(name = "conv1_hls",part = "xc7z020clg400-1",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

cfg = client.get_config_file(path="D:\SoC_PYNQ_Z2_MRI_CNN\Source\conv1_hls\hls_config.cfg")

cfg.set_values(key="syn.file", values=["conv1.cpp"])

cfg.set_values(key="syn.file", values=["conv1.cpp", "../conv1_params.h"])

cfg.set_values(key="syn.file", values=["conv1.cpp"])

cfg.set_values(key="syn.blackbox.file", values=[])

cfg.set_values(key="syn.file", values=["conv1.cpp", "./conv1_int8_params.h"])

cfg.set_values(key="tb.file", values=["./conv1_tb.cpp"])

comp = client.get_component(name="conv1_hls")
comp.run(operation="C_SIMULATION")

cfg.set_values(key="syn.file", values=["./conv1.cpp", "./conv1_int8_params.h"])

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="PACKAGE")

vitis.dispose()

vitis.dispose()

