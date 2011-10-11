#define	CT00CM			0x0064		//MCM 0x0064=10000k 5B=9100K 43=6700K 3A=5500K

#define CTHIGHVAL1		0x0138,0x8383, //CBCB
#define CTHIGHVAL2		0x013C,0x8383, //CBCB
#define CTHIGHVAL3		0x0140,0x8383, //CBCR
#define CTHIGHVAL4		0x0144,0x8383, //CRCR
#define CTHIGHVAL5		0x0148,0x8383, //CRCR

#define CTHIGHVAL1C		0x0138,0x8888, //CBCB
#define CTHIGHVAL2C		0x013C,0x8888, //CBCB
#define CTHIGHVAL3C		0x0140,0x887E, //CBCR
#define CTHIGHVAL4C		0x0144,0x7E7E, //CRCR
#define CTHIGHVAL5C		0x0148,0x7E7E, //CRCR

#define CTHIGHVAL1W		0x0138,0x7E7E, //CBCB
#define CTHIGHVAL2W		0x013C,0x7E7E, //CBCB
#define CTHIGHVAL3W		0x0140,0x7E88, //CBCR
#define CTHIGHVAL4W		0x0144,0x8888, //CRCR
#define CTHIGHVAL5W		0x0148,0x8888, //CRCR

#if defined(CONFIG_ARIES_LATONA)

mDNIe_data_type mDNIe_Video[]= 
{
	0x0084,0x0060, //algorithm selection+pcc + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0001, //de th.
	0x00c0,0x0400, //PCC skin
	0x00c4,0x7200, //    cb
	0x00c8,0x008d, //    cr
	0x00d0,0x00c0, //    strength. 3
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8d00, //cb
	0x0148,0x0073, //cr
	0x0134,0xFFF8, //LSF 248 
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Camera[]= 
{
	0x0084,0x0020, //algorithm selection + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0010, //de 0, ce off
	0x00ac,0x0000, //skin detect off, cs off
	0x00b4,0x03ff, //de th.
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8d00, //cb
	0x0148,0x0073, //cr
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Camera_Outdoor_Mode[]= 
{
	0x0084,0x00a0, //algorithm selection + ove
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0010, //de 127, ce off
	0x00ac,0x0000, //skin detect off, cs 128
	0x00b4,0x03ff, //de th.
	0x0100,0x5040, //ove
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8d00, //cb
	0x0148,0x0073, //cr
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_UI[]= 
{
	0x0084,0x0020, //algorithm selection + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0100, //de th.
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8d00, //cb
	0x0148,0x0073, //cr
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_Warm[]= 
{
	0x0084,0x0060, //algorithm selection+pcc + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0001, //de th.
	0x00c0,0x0400, //PCC skin
	0x00c4,0x7200, //    cb
	0x00c8,0x008d, //    cr
	0x00d0,0x00c0, //    strength. 3
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8000, //cb 0
	0x0148,0x0080, //cr 0
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_WO_Mode[]= 
{
	0x0084,0x00a0, //algorithm selection+pcc + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0001, //de th.
	0x00c0,0x0400, //PCC skin
	0x00c4,0x7200, //    cb
	0x00c8,0x008d, //    cr
	0x00d0,0x00c0, //    strength. 3
	0x0100,0x5050, //ove
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8000, //cb 0
	0x0148,0x0080, //cr 0
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_Cold[]= 
{
	0x0084,0x0060, //algorithm selection+pcc + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0001, //de th.
	0x00c0,0x0400, //PCC skin
	0x00c4,0x7200, //    cb
	0x00c8,0x008d, //    cr
	0x00d0,0x00c0, //    strength. 3
	0x0120,0x0064, //MCM 10000K
	0x0140,0x9300, //cb +19
	0x0148,0x006d, //cr -19
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_CO_Mode[]= 
{
	0x0084,0x00a0, //algorithm selection + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0001, //de th.
	0x00c0,0x0400, //PCC skin
	0x00c4,0x7200, //    cb
	0x00c8,0x008d, //    cr
	0x00d0,0x00c0, //    strength. 3
	0x0100,0x5050, //ove
	0x0120,0x0064, //MCM 10000K
	0x0140,0x9300, //cb +19
	0x0148,0x006d, //cr -19
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,

};

mDNIe_data_type mDNIe_Outdoor_Mode[]= 
{
	0x0084,0x00a0, //algorithm selection + ove
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0100, //de th.
	0x0100,0x5050, //ove
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8d00, //cb
	0x0148,0x0073, //cr
	0x0134,0xFFF8, //LSF 248
	END_SEQ, 0x0000,

};

mDNIe_data_type mDNIe_Gallery[]= 
{
	0x0084,0x0020, //algorithm selection + mcm
	0x0090,0x0000, //decontour th.
	0x0094,0x0fff, //directional th.
	0x0098,0x005c, //simplicity th.
	0x009c,0x0ff0, //de 127, ce off
	0x00ac,0x0200, //skin detect off, cs 512
	0x00b4,0x0100, //de th.
	0x0120,0x0064, //MCM 10000K
	0x0140,0x8d00, //cb
	0x0148,0x0073, //cr
	0x0134,0xFFF8, //LSF 248
	END_SEQ,0x0000,
};

#else   ///////////////////////////////////////////////////////////////

mDNIe_data_type mDNIe_Video[]= 
{
	0x0084, 0x0020,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005c,
	0x009c, 0x07f1, //de 127, ce off //de 63
	0x00ac, 0x0080, //skin detect off, cs 512 //cs 128
	0x00b4, 0x0100, //001, //de th.
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1
	CTHIGHVAL2
	CTHIGHVAL3
	CTHIGHVAL4
	CTHIGHVAL5
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Camera[]= 
{
	0x0084, 0x0020,
	0x0090, 0x0000,
	0x0094, 0x0FFF,
	0x0098, 0x005C,
	0x009C, 0x0011,
	0x00AC, 0x0000,
	0x00b4, 0x0100, //3ff, //de th.
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1
	CTHIGHVAL2
	CTHIGHVAL3
	CTHIGHVAL4
	CTHIGHVAL5
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Camera_Outdoor_Mode[]= 
{
	0x0084, 0x00a0,
	0x0090, 0x0000,
	0x0094, 0x0FFF,
	0x0098, 0x005C,
	0x009c, 0x0011, //de 0, ce off
	0x00ac, 0x0000, //skin detect off, cs off
	0x00b4, 0x0100, //3ff, //de th.
	0x0100, 0x5040,
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1
	CTHIGHVAL2
	CTHIGHVAL3
	CTHIGHVAL4
	CTHIGHVAL5
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_UI[]= 
{
#if 0
	0x0084, 0x0000,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005c,
	0x009C, 0x0010,
	0x00AC, 0x0000,
	0x00B4, 0x03ff,
	END_SEQ, 0x0000,
#else
	0x0084, 0x0020, // HDTR
	0x0090, 0x0000, // DeConTh off
	0x0094, 0x0FFF, // DirTh off
	0x0098, 0x005C, // SimplTh off
	0x009c, 0x0011, //0x01f0 de 15, ce off //0x00f0 de 7, ce off //0x0010 de 0, ce off //de off, ce off
	0x00ac, 0x0010, //20, //skin detect off, cs 32
	0x00B4, 0x0a00, // 0x03FF,  DETh ---- --00 0000 0000
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1
	CTHIGHVAL2
	CTHIGHVAL3
	CTHIGHVAL4
	CTHIGHVAL5
	END_SEQ, 0x0000,
#endif	
};

mDNIe_data_type mDNIe_Video_Warm[]= 
{
	0x0084, 0x0020,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005C,
	0x009c, 0x07f1, //ff1, //de 127, ce off //de 63
	0x00ac, 0x0080, //200, //skin detect off, cs 512 cs 128
	0x00b4, 0x0100, //001, //de th.
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1W
	CTHIGHVAL2W
	CTHIGHVAL3W
	CTHIGHVAL4W
	CTHIGHVAL5W
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_WO_Mode[]= 
{
	0x0084, 0x00a0,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005C,
	0x009c, 0x07f1, //ff1, //de 127, ce off
	0x00ac, 0x0080, //200, //skin detect off, cs 512
	0x00b4, 0x0100, //001, //de th.
	0x0100, 0x5050,
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1W
	CTHIGHVAL2W
	CTHIGHVAL3W
	CTHIGHVAL4W
	CTHIGHVAL5W
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_Cold[]= 
{
	0x0084, 0x0020,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005c,
	0x009c, 0x07f1, //ff1, //de 127, ce off
	0x00ac, 0x0080, //200, //skin detect off, cs 512
	0x00b4, 0x0100, //001, //de th.
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1C
	CTHIGHVAL2C
	CTHIGHVAL3C
	CTHIGHVAL4C
	CTHIGHVAL5C
	END_SEQ, 0x0000,
};

mDNIe_data_type mDNIe_Video_CO_Mode[]= 
{
	0x0084, 0x00a0,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005C,
	0x009c, 0x07f1, //ff1, //de 127, ce off
	0x00ac, 0x0080, //200, //skin detect off, cs 512
	0x00b4, 0x0100, //001, //de th.
	0x0100, 0x5050,
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1C
	CTHIGHVAL2C
	CTHIGHVAL3C
	CTHIGHVAL4C
	CTHIGHVAL5C
	END_SEQ, 0x0000,

};

mDNIe_data_type mDNIe_Outdoor_Mode[]= 
{
	0x0084, 0x00a0,
	0x0090, 0x0000,
	0x0094, 0x0fff,
	0x0098, 0x005C,
	0x009c, 0x0011, //de 127, ce off //de 63
	0x00ac, 0x0010, //skin detect off, cs 512 //cs 256
	0x00B4, 0x0001,
	0x0100, 0x5050,
	0x0120, CT00CM, //MCM 10000K
	CTHIGHVAL1
	CTHIGHVAL2
	CTHIGHVAL3
	CTHIGHVAL4
	CTHIGHVAL5
	END_SEQ, 0x0000,

};

#endif
