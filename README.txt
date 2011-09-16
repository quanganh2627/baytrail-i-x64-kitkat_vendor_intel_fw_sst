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
