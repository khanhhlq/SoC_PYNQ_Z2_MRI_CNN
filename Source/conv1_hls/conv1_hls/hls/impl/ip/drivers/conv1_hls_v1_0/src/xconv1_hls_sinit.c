// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2026.1 (64-bit)
// Tool Version Limit: 2026.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xconv1_hls.h"

extern XConv1_hls_Config XConv1_hls_ConfigTable[];

#ifdef SDT
XConv1_hls_Config *XConv1_hls_LookupConfig(UINTPTR BaseAddress) {
	XConv1_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XConv1_hls_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XConv1_hls_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XConv1_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XConv1_hls_Initialize(XConv1_hls *InstancePtr, UINTPTR BaseAddress) {
	XConv1_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XConv1_hls_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XConv1_hls_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XConv1_hls_Config *XConv1_hls_LookupConfig(u16 DeviceId) {
	XConv1_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCONV1_HLS_NUM_INSTANCES; Index++) {
		if (XConv1_hls_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XConv1_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XConv1_hls_Initialize(XConv1_hls *InstancePtr, u16 DeviceId) {
	XConv1_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XConv1_hls_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XConv1_hls_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

