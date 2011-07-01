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
June 21 2011: Rohit Kumar Sindhu: Audio FW Ver.03.00.10
	BZ1795 - Occasional silence is heard on speaker when the video start/stop button is pressed.
	Rootcaused to channel swap of data sent to MSIC. Fix is to configure and enable SSP and then
	enable DMA transfer.
	BZ3250 - Separate the parameters for Mono and Stereo equalizer as requested by Audio Tuning App
	The parameter tuning interface provided by LPE FW gives separate interface for Mono and Stereo
	equalizers.
	BZ3012 - when ALSA API for pause/resume are used, resume fails
	Rootcaused to incomplete implementation of resume API in LPE FW. Resume API now updated.
	BZ3652 - Audio FW support for LPMP3 @ 19.2 MHz
	Currently for LPMP3 usecase, LPE runs at 50MHz in PLL mode. With this fix, LPE will run at 19.2MHz in
	Oscillator mode in LPMP3 usecase.
June 25 2011: Rohit Kumar Sindhu: Audio FW Ver.03.00.11
	BZ2271 - After taking some images, no shutter sound when capturing the image
	BZ3383 - Buffer underrun and pcm write error is with buffer time 20000 
	and period size 10000
	This firmware fixes are to reset all pipeline buffers whenever DROP message is received, 
	as in both these cases, the issue observed is that input DMA stops randomly, 
	when continuous START and DROP messages are received.
