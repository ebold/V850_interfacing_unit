VERSION 6
BEGIN SCHEMATIC
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL fr_out
        SIGNAL ck_out
        SIGNAL D(7:0)
        SIGNAL P(7:0)
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL D(0)
        SIGNAL D(1)
        SIGNAL D(2)
        SIGNAL D(3)
        SIGNAL D(4)
        SIGNAL D(5)
        SIGNAL D(6)
        SIGNAL D(7)
        SIGNAL P(0)
        SIGNAL P(1)
        SIGNAL P(2)
        SIGNAL P(3)
        SIGNAL P(4)
        SIGNAL P(5)
        SIGNAL P(6)
        SIGNAL P(7)
        SIGNAL C(7:0)
        SIGNAL XLXN_28
        SIGNAL XLXN_29
        SIGNAL modd
        SIGNAL frame
        PORT Output fr_out
        PORT Output ck_out
        PORT Input modd
        PORT Input frame
        BEGIN BLOCKDEF ftc
            TIMESTAMP 2008 9 1 10 24 23
            RECTANGLE N 64 -320 320 -64 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 384 -256 320 -256 
            LINE N 0 -256 64 -256 
            LINE N 0 -32 64 -32 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF comp8
            TIMESTAMP 2008 9 1 10 24 23
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -224 320 -224 
            RECTANGLE N 0 -332 64 -308 
            LINE N 0 -320 64 -320 
            RECTANGLE N 0 -140 64 -116 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 96 -64 32 -64 
            LINE N 64 0 64 -32 
            LINE N 64 -32 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 64 -128 64 -96 
            LINE N 64 -64 64 -80 
            LINE N 88 -64 40 -64 
            LINE N 68 -32 60 -32 
            LINE N 76 -48 52 -48 
            LINE N 64 -64 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF cb8ce
            TIMESTAMP 2008 9 1 10 24 23
            LINE N 384 -128 320 -128 
            RECTANGLE N 320 -268 384 -244 
            LINE N 384 -256 320 -256 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 384 -192 320 -192 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCK I60 ftc
            PIN C XLXN_3
            PIN CLR XLXN_2
            PIN T XLXN_1
            PIN Q fr_out
        END BLOCK
        BEGIN BLOCK I35 inv
            PIN I modd
            PIN O XLXN_29
        END BLOCK
        BEGIN BLOCK I36 inv
            PIN I frame
            PIN O XLXN_28
        END BLOCK
        BEGIN BLOCK I37 and2
            PIN I0 frame
            PIN I1 XLXN_8
            PIN O XLXN_3
        END BLOCK
        BEGIN BLOCK I38 or2
            PIN I0 XLXN_10
            PIN I1 XLXN_9
            PIN O XLXN_8
        END BLOCK
        BEGIN BLOCK I39 comp8
            PIN A(7:0) C(7:0)
            PIN B(7:0) D(7:0)
            PIN EQ XLXN_10
        END BLOCK
        BEGIN BLOCK I40 comp8
            PIN A(7:0) P(7:0)
            PIN B(7:0) C(7:0)
            PIN EQ XLXN_9
        END BLOCK
        BEGIN BLOCK I41 buf
            PIN I XLXN_3
            PIN O ck_out
        END BLOCK
        BEGIN BLOCK I59 vcc
            PIN P XLXN_1
        END BLOCK
        BEGIN BLOCK I42 vcc
            PIN P D(5)
        END BLOCK
        BEGIN BLOCK I61 gnd
            PIN G XLXN_2
        END BLOCK
        BEGIN BLOCK I43 gnd
            PIN G P(0)
        END BLOCK
        BEGIN BLOCK I44 gnd
            PIN G P(1)
        END BLOCK
        BEGIN BLOCK I45 gnd
            PIN G P(2)
        END BLOCK
        BEGIN BLOCK I46 gnd
            PIN G P(3)
        END BLOCK
        BEGIN BLOCK I47 gnd
            PIN G P(4)
        END BLOCK
        BEGIN BLOCK I48 gnd
            PIN G P(5)
        END BLOCK
        BEGIN BLOCK I49 gnd
            PIN G P(6)
        END BLOCK
        BEGIN BLOCK I50 gnd
            PIN G P(7)
        END BLOCK
        BEGIN BLOCK I51 gnd
            PIN G D(7)
        END BLOCK
        BEGIN BLOCK I52 gnd
            PIN G D(6)
        END BLOCK
        BEGIN BLOCK I53 gnd
            PIN G D(4)
        END BLOCK
        BEGIN BLOCK I54 gnd
            PIN G D(3)
        END BLOCK
        BEGIN BLOCK I55 gnd
            PIN G D(2)
        END BLOCK
        BEGIN BLOCK I56 gnd
            PIN G D(1)
        END BLOCK
        BEGIN BLOCK I57 gnd
            PIN G D(0)
        END BLOCK
        BEGIN BLOCK I58 cb8ce
            PIN C XLXN_28
            PIN CE XLXN_29
            PIN CLR modd
            PIN CEO
            PIN Q(7:0) C(7:0)
            PIN TC
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE I60 2816 2048 R0
        INSTANCE I35 608 1392 R0
        INSTANCE I36 608 1456 R0
        INSTANCE I37 2704 1536 R0
        INSTANCE I38 2240 1504 R0
        INSTANCE I39 1744 2064 R0
        INSTANCE I40 1744 1184 R0
        INSTANCE I41 3056 1392 R270
        INSTANCE I59 2736 1856 R270
        INSTANCE I42 1440 2176 M90
        INSTANCE I61 2672 2144 R0
        INSTANCE I43 1312 656 R90
        INSTANCE I44 1312 576 R90
        INSTANCE I45 1312 496 R90
        INSTANCE I46 1312 416 R90
        INSTANCE I47 1312 336 R90
        INSTANCE I48 1312 256 R90
        INSTANCE I49 1312 176 R90
        INSTANCE I50 1312 96 R90
        INSTANCE I51 1312 2016 R90
        INSTANCE I52 1312 2096 R90
        INSTANCE I53 1312 2256 R90
        INSTANCE I54 1312 2336 R90
        INSTANCE I55 1312 2416 R90
        INSTANCE I56 1312 2496 R90
        INSTANCE I57 1312 2576 R90
        INSTANCE I58 928 1552 R0
        BEGIN BRANCH XLXN_1
            WIRE 2736 1792 2816 1792
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 2736 2016 2816 2016
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 2496 1584 3024 1584
            WIRE 2496 1584 2496 1920
            WIRE 2496 1920 2816 1920
            WIRE 2960 1440 3024 1440
            WIRE 3024 1440 3024 1584
            WIRE 3024 1392 3024 1440
        END BRANCH
        BEGIN BRANCH fr_out
            WIRE 3200 1792 3408 1792
        END BRANCH
        IOMARKER 3408 1792 fr_out R0 28
        BEGIN BRANCH ck_out
            WIRE 3024 1168 3088 1168
        END BRANCH
        IOMARKER 3088 1168 ck_out R0 28
        BEGIN BRANCH D(7:0)
            WIRE 1600 1936 1600 2080
            WIRE 1600 2080 1600 2160
            WIRE 1600 2160 1600 2240
            WIRE 1600 2240 1600 2320
            WIRE 1600 2320 1600 2400
            WIRE 1600 2400 1600 2480
            WIRE 1600 2480 1600 2560
            WIRE 1600 2560 1600 2640
            WIRE 1600 1936 1664 1936
            WIRE 1664 1936 1744 1936
            BEGIN DISPLAY 1664 1936 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH P(7:0)
            WIRE 1600 160 1600 240
            WIRE 1600 240 1600 320
            WIRE 1600 320 1600 400
            WIRE 1600 400 1600 480
            WIRE 1600 480 1600 560
            WIRE 1600 560 1600 640
            WIRE 1600 640 1600 720
            WIRE 1600 720 1600 864
            WIRE 1600 864 1664 864
            WIRE 1664 864 1744 864
            BEGIN DISPLAY 1664 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 2496 1408 2704 1408
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 2128 960 2240 960
            WIRE 2240 960 2240 1376
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 2128 1840 2240 1840
            WIRE 2240 1440 2240 1840
        END BRANCH
        BEGIN BRANCH D(0)
            WIRE 1440 2640 1520 2640
            WIRE 1520 2640 1584 2640
            BEGIN DISPLAY 1520 2640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2640 1584 2640
        BEGIN BRANCH D(1)
            WIRE 1440 2560 1520 2560
            WIRE 1520 2560 1584 2560
            BEGIN DISPLAY 1520 2560 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2560 1584 2560
        BEGIN BRANCH D(2)
            WIRE 1440 2480 1520 2480
            WIRE 1520 2480 1584 2480
            BEGIN DISPLAY 1520 2480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2480 1584 2480
        BEGIN BRANCH D(3)
            WIRE 1440 2400 1520 2400
            WIRE 1520 2400 1584 2400
            BEGIN DISPLAY 1520 2400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2400 1584 2400
        BEGIN BRANCH D(4)
            WIRE 1440 2320 1520 2320
            WIRE 1520 2320 1584 2320
            BEGIN DISPLAY 1520 2320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2320 1584 2320
        BEGIN BRANCH D(5)
            WIRE 1440 2240 1520 2240
            WIRE 1520 2240 1584 2240
            BEGIN DISPLAY 1520 2240 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2240 1584 2240
        BEGIN BRANCH D(6)
            WIRE 1440 2160 1520 2160
            WIRE 1520 2160 1584 2160
            BEGIN DISPLAY 1520 2160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2160 1584 2160
        BEGIN BRANCH D(7)
            WIRE 1440 2080 1520 2080
            WIRE 1520 2080 1584 2080
            BEGIN DISPLAY 1520 2080 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 2080 1584 2080
        BEGIN BRANCH P(0)
            WIRE 1440 720 1520 720
            WIRE 1520 720 1584 720
            BEGIN DISPLAY 1520 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 720 1584 720
        BEGIN BRANCH P(1)
            WIRE 1440 640 1520 640
            WIRE 1520 640 1584 640
            BEGIN DISPLAY 1520 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 640 1584 640
        BEGIN BRANCH P(2)
            WIRE 1440 560 1520 560
            WIRE 1520 560 1584 560
            BEGIN DISPLAY 1520 560 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 560 1584 560
        BEGIN BRANCH P(3)
            WIRE 1440 480 1520 480
            WIRE 1520 480 1584 480
            BEGIN DISPLAY 1520 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 480 1584 480
        BEGIN BRANCH P(4)
            WIRE 1440 400 1520 400
            WIRE 1520 400 1584 400
            BEGIN DISPLAY 1520 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 400 1584 400
        BEGIN BRANCH P(5)
            WIRE 1440 320 1520 320
            WIRE 1520 320 1584 320
            BEGIN DISPLAY 1520 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 320 1584 320
        BEGIN BRANCH P(6)
            WIRE 1440 240 1520 240
            WIRE 1520 240 1584 240
            BEGIN DISPLAY 1520 240 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 240 1584 240
        BEGIN BRANCH P(7)
            WIRE 1440 160 1520 160
            WIRE 1520 160 1584 160
            BEGIN DISPLAY 1520 160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1600 160 1584 160
        BEGIN BRANCH C(7:0)
            WIRE 1312 1296 1440 1296
            WIRE 1440 1296 1600 1296
            WIRE 1600 1296 1600 1744
            WIRE 1600 1744 1744 1744
            WIRE 1600 1056 1600 1296
            WIRE 1600 1056 1744 1056
            BEGIN DISPLAY 1440 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 832 1424 928 1424
        END BRANCH
        BEGIN BRANCH XLXN_29
            WIRE 832 1360 928 1360
        END BRANCH
        BEGIN BRANCH modd
            WIRE 320 1360 560 1360
            WIRE 560 1360 608 1360
            WIRE 560 1360 560 1520
            WIRE 560 1520 928 1520
        END BRANCH
        IOMARKER 320 1360 modd R180 28
        BEGIN BRANCH frame
            WIRE 2656 1472 2704 1472
            BEGIN DISPLAY 2656 1472 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH frame
            WIRE 320 1424 464 1424
            WIRE 464 1424 608 1424
            BEGIN DISPLAY 464 1424 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 320 1424 frame R180 28
    END SHEET
END SCHEMATIC
