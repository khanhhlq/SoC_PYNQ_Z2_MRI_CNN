# 2026-11-10T14:36:28.834065800
import vitis

client = vitis.create_client()
client.set_workspace(path="Source")

comp = client.get_component(name="conv1_hls")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="PACKAGE")

comp.run(operation="CO_SIMULATION")

comp.run(operation="PACKAGE")

vitis.dispose()

