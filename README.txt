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
July 14 2011: Sanyog Kale: Audio FW Ver.03.00.12
	BZ 1795 - There.s no click sound when video starts or stops to record (50%-re-producibility)
	BZ 3383 - Buffer underrun and pcm write error is with buffer time 20000 and period size 10000
	BZ 4213 - If long run playback goes beyong six hrs, the audio quality gets poor
	BZ 4305 - Power impact: Uneven SST driver wakes seen in ftrace during Music playback
        BZ 4867 - music stop sometimes when click power key 
	This issue is observed occasionally when underrun occurs and drop is received in FW, the 
	Input DMA is not initiated in subsequent start stream message. Further pointer update was 
	not happening at period boundaries after few hours which may cause periodic underruns
	leading to glitches or noise.
	Fix is to reset stream context appropriately when drop is received to ensure Input DMA is
	initiated always. Further the pointer update mechanism is optimized to handle small period sizes.
August 12 2011: Sanyog Kale: Audio FW Ver.03.00.14
        BZ 4482 - The alarm/incoming call runs but doesn't ring at the beginning of voice recording.
	BZ 4951 - The ringtone of the SMS doesn't play when recording video.
	BZ 5149 - when alsa_aplay and alsa_arecord are used at the same time with buffer time 20000 
       	and period size 10000 alsa_aplay plays silent
        BZ 5700 - There.s no click sound when video starts or stops to record (10%-re-producibility).
	BZ 6054 - No ring tone from the Incoming call during video record. 
	This issue of channel swap was observed when there was simultanoues playback
	and capture running. Sometimes playback channels use to get swapped
	to different channel and no audio was heard.
	Channel swap issue is fixed and data always goes in right slot
	when simulatenous playback and capture is performed.
August 17 2011: Rohit Kumar Sindhu: Audio FW Ver.03.00.15
       BZ 4860 - Parameters not independent from one another
       BZ 4895 - Unable to get parameter block
       BZ 6487 - LPE parameters side-effected (Parameter handling layers are algorithm instance unaware)
       BZ 6488 - Unable to set Equalizer IIR and FIR coefficients (Parameter size not constant)
       In BZ 4860, few parameters were not required, such as filter coefficient size for stereo mono EQ and DC
       removal module. Those parameters were removed as they were wasting lot of code. Also some of the parameters
       who are dependent on each other were logically combined.
       In BZ 4895, get_param() interface with modules were not selective as set_param() inteface. So Get parameter
       interface was changed for user to selectively get the parameters. For this user is expected to send
       a pre allocated buffer to LPE in which LPE will copy back the data which it gets from the modules.
       In BZ 6487, we removed the local storage of the coefficients parameters, the parameters are stored only
       in the persistance memory of the module instance, so no duplication happens. Packin and unpacking of
       parameters are completely removed from the LPE. Now the get set request goes directly to the module.
       In BX 6488, fixed maximum size of FIR and IIR fileter coefficients are implemented. So if the size of
       actual parameters are less than maximum, in case of get the rest of the bytes are filled with zero,
       and in case of set rest of the parameters are skipped.
August 29 2011: Rohit Kumar Sindhu: Audio FW Ver.03.00.16
       BZ 7887 - [CAMERA] Recording stress tests are failing
       BZ 6961 - During simultaneous playback on HS and IHF, completion of Pb
                 on either of the device(IHF or HS) stops other playback also.
       BZ 7402 - [Audio]press soft keyboard about 30 times in recording, 
                 no keypress tone played
       In BZ 7887, DMA channels were not properly configured when simultaneous
       and capture were on, so it failed during repeated stress tests.
       In BZ 6961, support for simultaneous playback on headset and IHF devices 
       was not there. It is enabled now.
       In BZ 7402, the issue was again woth simultaneous capture and playback related to DMA channels setting,
       so fix for bz7887 fixs this also.
September 16 2011: Sanyog Kale: Aufio FW Ver.03.00.17
	BZ 8868 -  [Monkey] [Audio] Sound recorder stopped unexpectedly when doing Monkey Test 
		    on .com.android.soundrecorder
	BZ 9874 - PnP register settings for LPE DMA - PROCTL and FIFO mode.
	There was a condtion where Firmware use to enter into unresponsive state during clock switching
	due to which recording use to stop and firmware use to not respond furthur. This issue is fixed.
        Enhancement done to set PROCTL for DMA memory to memory transfers.
September 23 2011: Rohit K Sindhu: Aufio FW Ver.03.00.18
	BZ 9703 - [Camera] Capture pictures with wsHS, camera freeze
	BZ 10149 - cannot record any more after record video many times(video-recording-stress testing)
	BZ 10238 - [MTBF] Audio/ AudioHardwareAlsa read errors 
	Whenever clk switching is initiated by LPE FW, it will suspend the ddr dma, 
	during this time a race condition occurs causing the FW to be stalled.
	Further, there was a issue with the FW internal state wrt link up/down status messages.
	Also when there is simultaneous playback and capture like in video recording case 
	there were frequent clock switches which we suspect to be affecting system stability.
	Solution is to fix the dma suspend race condition and also keep LPE always at 50MHz 
	to avoid the frequent clock switches. The FW state wrt link up/down status messages is corrected.
	This has been observed to have improved stability of video recording stress test.
October 04 2011: Rohit K Sindhu: Aufio FW Ver.03.00.19
	BZ 10967 - PNW SC_AE_LEP_DMA0 / DMA1 CFG0 reg configuration needs to be corrected. details inside.
	When PROCTL bits in DMA CFG reg are set to the PnP taskforce recommended value
	of '010b' it is causing audio DMA failure resulting in fabric error because of posted writes.
	This LPE FW will set PROCTL bits to '000'b value to disable posted writes. 
October 24 2011: Lakshmi N Vinnakota : Audio FW Ver.03.00.20
	BZ 9702 - (main camera) video recorder stress test failed
	Whenever DROP is received for either playback or capture stream, audio FW was disabling the DMA
	transfer in progress by directly disabling the channel for the peripheral transfers. This causes
	DMA burst timeout in the audio fabric.

	Solution is to always wait for the current DMA block transfer to complete. And then do SSP cleanup.
October 26 2011: Lakshmi N Vinnakota : Audio FW Ver.03.00.21
	BZ 13024 - In LPE FW v3.0.20, capture stream I/O errors are observed 
	Whenever DROP is received for either playback or capture stream, audio FW 
	will stop the DMA only after the current block transfer is complete. But
	if a START stream is received before the DMA completes, then a race condn
	occurs and renderer/capturer pipeline stalls. Also for playback stream, if
	the LINK_UP response is delayed by more than 4ms, then it was stalling the
	renderer pipeline.
	Solution is to identify these two conditions clearly and restart the 
	renderer/capturer pipeline.
December 5 2011: Rohit K Sindhu : Audio FW Ver.03.00.22
        BZ 13431 - Video capture if stopped before 1 sec/2sec, stop gets delayed and
        video clip of length 10 sec/11 sec is captured
        BZ 13744 - [Camera]shutter sound doesn't work after tapping shutter many times
        BZ 14443 - [Camera] Have no shutter voice during burst capturing
        BZ 16119 - PR3 can't capture one video after pressed power button twice

        Whenever DROP is received audio FW will stop the DMA only after the current
        block transfer is complete. But if a START stream is received before the DMA
        completes, then a race condn occurs and playback/renderer pipeline stalls. The
        playback i/o error was causing capture i/o error in case of video recording.

        Fix is to stop renderer/capturer only when stream is freed and not in drop.

December 8 2011: Rohit K Sindhu : Audio FW Ver.03.00.23
	BZ 7949 - EQ config and IIR Section Count parameters are not independent
	If number of IIR sections are more than 1 then FIR filter can not be enabled.
	So in this case number of IIR filter section and FIR filter status are
	dependent on each other. So 2 bytes for number of IIR filter section were
	moved from IIR filter coefficients to channel configuration where FIR enable
	status, IIR enable status and number of IIR sections were ored with each other

	BZ 16871 - Increase Maximum Gain for volume control library for Customer
	issue during WW50.
	Maximum gain supported by volume control library has to be increased to 25dB
	from 18dB, in oder to match Google specs. New volume control library has
	been integrated with LPE.

December 19 2011: Rohit K Sindhu : Audio FW Ver.03.00.24
	Bug 15936 - [Audio] Streaming sound becomes abnormal after recording with 
	Sound Recorder. This was caused due to un-initialization of variable which 
	retains old value resulting noisy playback.The problem was found during
	klocwork analysis of the LPE code.

	Bug 16834 - crash when applying less than 32 taps in equalizer FIR filter.
	There was a bug in Mono and Stereo EQ modules, that when the number of taps
	for FIR filter was changed, FIR delay field was not updated in the set_param() 
	function. This was causing memory corruption inside the MONO EQ assembly code.

January 2, 2012:  Sanyog Kale : Audio FW ver 03.00.25
	Bug 18108 - [IMAGING] Shutter sound not heard when taking a photo.
	The issue was with WAITI implementation in firmware due to which in some
	cases firmware stuck in WAITI and delays coming out of WAITI resulting into
	no audio. Currently WAITI is disabled in firmware and issue is not observed.

January 16, 2012: Sanyog Kale : Audio FW ver 03.00.26
	Bug 20210 - Audio Firmware doesnt Respond to IPC messages within 5 secs.
	The issue was with WAITI implementation in firmware due to which in some
	cases firmware stuck in WAITI and delays coming out of WAITI resulting into
	no audio. This issue with WAITI is fixed in firmware no more issues observed
	with WAITI implemented.

Feb 02 2012: KP, Jeeja : Audio FW Ver.04.00.01
	BZ: 15274 15273 - Add support to enable Audio for Clovertrail
	Added master mode SSP changed for CLV

February 15 2012: Sanyog Kale : Audio FW ver 03.00.27
	Bug 23764 - Audio Firmware Workaround needed to mitigate glitch at 
	starting of capture produced by MSIC hardware.
	The initial glitch in capture stream is caused by MSIC hardware. 
	Workaround is done in LPE firmware by lowering MIC gain to 0dB 
	for 80ms at starting of capture stream and then reverting back 
	original gain set by PFW, till hardware issue is root caused.

February 23 2012: Sanyog Kale : Audio FW ver 03.00.28
	Bug 24061 - Fabric error after sound+vibrate notification.
	After S3, any shared SRAM region has to be initialized before being
	read due to SRAM ECC silicon issue. Audio has 72k of SRAM region 
	reserved for Audio use. It is observed that very randomly IA read/write
	access to SRAM Audio region may be byte accesses which can result 
	in SRAM ECC error. 
	Since the IA access cannot be guaranteed to be always 32-bit, 
	workaround is provided in Audio Firmware to initialize whole of 
	72K Audio SRAM region which will improve stability.
	Further this version of FW has minor improvements for the fix 
	provided in FW v3.0.27.

Feb 28 2012: Thomas, Tigi : Audio FW Ver.04.00.02
	BZ: 25454 - Adding the intial PFW framework support for the CLV FW.
	MFDR3 code base with SSP Master mode changes.

March 01 2012: Sanyog Kale : Audio FW ver 03.00.29
	BZ: 25920 - CTS Overflow check regression with Audio FW 3.0.28 
	(patch 36412).
	This version of LPE FW reverts the changes done in FW v3.0.28
	for the capture glich workaround and goes back to the workaround
	provided in FW v3.0.27.
	This patch has been rebased from R2 . Combining 3.0.27 and 3.0.28
	This patch has been rebased by Arulselvan M

March 06 2012: Sanyog Kale : Audio FW ver 03.00.30
	BZ 23047  - Add support for Stereo to Mono downmix for Mono speaker 
	support - CR 93041 
	Firmware will always receive stereo data from Android, depending 
	on the IHF device on the platform, it shall render stereo data 
	for stereo IHF or downmix to Mono for Mono IHF. 
	Platform info will be provided by Audio driver.

March 13 2012: Sanyog Kale : Audio FW ver 03.00.31
	Bug 16652 - click sound is heard beginning of the
        recorded file <using alsa_arecord>
	Bug 26989 - CTS verifier gain linearity passes inconsistently
	depending on HW / FW version
	The initial glitch in capture stream is caused by MSIC hardware due to
	large settling time of 900ms. 
	The initial WA provided for removing the glitch was not stable and
	affected the Gain linearity tests.
	New Gain control algorithm added in LPE firmware which implements
	ramp time of 2ms per dB. This removes the initial glitch completely
	and also ensures that Gain linearity is not affected. This firmware
	passes all CTS test cases whether run together or independently.

March 20 2012: Sanyog Kale : Audio FW ver 03.00.32
	Bug 20263 - DRC needed to mitigate poor volume output from loudspeaker.
	Currently the output volume of IHF is very low. DRC (Dynamic Range 
	Compression) Algorithm is integrated in Audio firmware in IHF path 
	which will boost up volume level of IHF device.

March 22 2012: Tigi Thomas : Audio FW ver 05.02.00
       Bug 28160 -  Audio Firmware for Listen to Music - IHF.
       Bug 25438 -  CPA-P_CAP-61073 Dynamic Range Compression (DRC) on 
       embedded loudspeaker.
       IHF Playback stream is enabled in the Firmware by using the mixer controls IPC
       messages. 
       DRC (Dynamic Range Compression) Algorithm is integrated in Audio firmware 
       in IHF path which will boost up volume level of IHF.
