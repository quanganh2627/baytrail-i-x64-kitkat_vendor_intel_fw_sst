Mar 18 2011: Dharageswari R: Audio FW Ver.03.00.02  added
Mar 25 2011: Ramesh Babu K V: Audio FW Ver.03.00.03
	i. Firmware supports both 16 and 24 bit format.
	ii. All Post Processing Algorithms are enabled with 24-bit precision.
Apr 26 2011: Ramesh Babu K V: Audio FW Ver.03.00.05
	BZ 1281,535,666,1285
	The fix involves implementing a fail recovery mechanism for the issue of LPE FW pipeline stall when
	the Input DMA(DDR->LPE DRAM) is delayed due to system conditions like delay in SCU FW response
	for DDR LINK_UP message.
May 03 2011: Rohit K Sindhu: Audio FW Ver.03.00.06
	BZ 1589
	This fix is for audio playback with odd period sizes and volume control enabled. In order to fix this
	problem the DMA latency buffer is changed to 4ms from 2ms.
May 31 2011: Lakshmi Vinnakota: Audio FW Ver.03.00.08
	BZ 2935 
	This Firmware disables PTI logging which is required for LPMP3 to work, as PTI does not
	work in LPMP3(S0i1) mode.
