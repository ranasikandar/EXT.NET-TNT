﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="TNT.TestPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function loadtime() {
            document.getElementById('datevar').innerHTML = new Date().toLocaleTimeString();
        };

    </script>


    <style type="text/css">
     #form2
        {
            /*background: rgb(245,246,246);*/
            background: -webkit-linear-gradient(top, rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%);
            background: linear-gradient(to bottom, rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%);

        }
        
        /*
        #mainBody-body
        {
            background: rgb(245,100,100) !important;
        }
        
        #x-panel-body-default
        {
            background: rgb(245,100,100) !important;
        }
        
        #Bank Markup-body
        {
            background: rgb(245,100,100) !important;
        }
        
        #Pages-body
        {
            background: rgb(245,100,100) !important;
        }
        
        .x-panel-body-default
        {
            background: rgb(245,100,100) !important;
        }
        
        #Bank Markup_IFrame
        {
        background: rgb(245,246,246);
        background: -webkit-linear-gradient(top, rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%);
        background: linear-gradient(to bottom, rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%);
        }*/
        
        /*.HomeHeaderImage
        {
            background: rgb(245,246,246);
            background: -webkit-linear-gradient(top, rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%);
            background: linear-gradient(to bottom, rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%);
            
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100% 100%;
        }*/
        
        
    </style>

</head>
<body onload="loadtime()">
    <form id="form2" runat="server">
    <div>
    <center>
    <h3 id="datevar">Hello Ext.net</h3>
    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="652.000000pt" height="57.000000pt"
    viewbox="0 0 652.000000 57.000000" preserveaspectratio="xMidYMid meet">
<g transform="translate(0.000000,57.000000) scale(0.100000,-0.100000)"
fill="#000000" stroke="none">
<path d="M1480 449 c-61 -24 -87 -87 -55 -135 18 -27 86 -63 121 -64 12 0 32
-8 45 -19 20 -16 21 -21 10 -35 -25 -30 -101 -11 -101 25 0 5 -20 9 -45 9 -55
0 -65 -16 -38 -62 66 -115 293 -76 293 49 0 53 -40 86 -128 108 -57 13 -72 21
-70 34 4 22 61 27 78 7 14 -18 110 -23 110 -6 0 28 -35 73 -65 86 -39 16 -118
18 -155 3z"/>
<path d="M3824 450 c-41 -13 -100 -79 -113 -127 -26 -93 5 -195 74 -242 70
-47 176 -37 250 24 27 22 28 24 9 25 -12 0 -43 -10 -69 -21 -58 -26 -133 -22
-173 8 -49 37 -65 68 -66 130 -1 101 52 163 146 171 44 3 59 0 88 -20 63 -43
75 -138 24 -193 -30 -32 -56 -34 -49 -3 9 41 25 141 25 155 0 7 -9 13 -20 13
-11 0 -20 -4 -20 -10 0 -5 -13 -2 -29 8 -41 23 -79 8 -108 -43 -32 -57 -31
-128 2 -160 27 -28 66 -32 85 -10 12 14 15 14 31 -1 41 -37 131 26 145 101 20
109 -44 195 -148 201 -29 2 -67 -1 -84 -6z"/>
<path d="M90 281 l0 -171 50 0 50 0 0 65 c0 45 4 65 13 65 21 0 33 -14 67 -72
l32 -58 60 0 59 0 -32 61 c-18 33 -44 66 -58 74 -20 11 -22 14 -8 15 10 0 29
11 42 25 36 35 35 102 -1 136 -24 22 -34 24 -150 27 l-124 4 0 -171z"/>
<path d="M1920 280 l0 -170 50 0 50 0 0 33 c0 20 8 41 18 50 18 16 20 14 42
-33 l23 -50 54 0 53 0 -45 76 c-25 42 -45 78 -45 82 0 3 19 26 42 49 l42 43
-57 0 c-53 0 -59 -3 -92 -37 l-34 -38 -1 83 0 82 -50 0 -50 0 0 -170z"/>
<path d="M3050 399 c0 -45 -2 -50 -17 -43 -10 4 -34 9 -54 12 -30 3 -43 -2
-69 -25 -28 -25 -34 -38 -38 -86 -10 -119 63 -188 151 -143 15 8 27 11 27 5 0
-5 20 -9 45 -9 l45 0 0 170 0 170 -45 0 -45 0 0 -51z"/>
<path d="M5050 280 l0 -170 50 0 50 0 0 170 0 170 -50 0 -50 0 0 -170z"/>
<path d="M495 355 c-58 -31 -60 -61 -5 -70 30 -5 44 -3 56 10 20 19 69 16 69
-4 0 -10 -24 -21 -68 -32 -82 -21 -107 -40 -107 -85 0 -66 88 -96 158 -54 26
16 32 17 32 5 0 -11 12 -15 46 -15 38 0 45 3 40 16 -3 9 -6 53 -6 99 0 74 -3
87 -24 112 -21 24 -32 28 -92 31 -50 2 -77 -2 -99 -13z"/>
<path d="M886 349 c-21 -17 -26 -18 -26 -5 0 12 -11 16 -45 16 l-45 0 0 -125
0 -125 45 0 45 0 0 69 c0 84 12 121 39 121 30 0 41 -30 41 -114 l0 -76 45 0
45 0 0 105 c0 99 -2 107 -25 130 -30 31 -82 33 -119 4z"/>
<path d="M1135 355 c-58 -31 -60 -61 -5 -70 30 -5 44 -3 56 10 20 19 69 16 69
-4 0 -10 -24 -21 -68 -32 -82 -21 -107 -40 -107 -85 0 -66 88 -96 158 -54 26
16 32 17 32 5 0 -11 12 -15 46 -15 38 0 45 3 40 16 -3 9 -6 53 -6 99 0 74 -3
87 -24 112 -21 24 -32 28 -92 31 -50 2 -77 -2 -99 -13z"/>
<path d="M2285 355 c-58 -31 -60 -61 -5 -70 30 -5 44 -3 56 10 20 19 69 16 69
-4 0 -10 -24 -21 -68 -32 -82 -21 -107 -40 -107 -85 0 -66 88 -96 158 -54 26
16 32 17 32 5 0 -11 12 -15 46 -15 38 0 45 3 40 16 -3 9 -6 53 -6 99 0 74 -3
87 -24 112 -21 24 -32 28 -92 31 -50 2 -77 -2 -99 -13z"/>
<path d="M2676 349 c-21 -17 -26 -18 -26 -5 0 12 -11 16 -45 16 l-45 0 0 -125
0 -125 45 0 45 0 0 69 c0 84 12 121 39 121 30 0 41 -30 41 -114 l0 -76 45 0
45 0 0 105 c0 99 -2 107 -25 130 -30 31 -82 33 -119 4z"/>
<path d="M3245 355 c-58 -31 -60 -61 -5 -70 30 -5 44 -3 56 10 20 19 69 16 69
-4 0 -10 -24 -21 -68 -32 -82 -21 -107 -40 -107 -85 0 -66 88 -96 158 -54 26
16 32 17 32 5 0 -11 12 -15 46 -15 38 0 45 3 40 16 -3 9 -6 53 -6 99 0 74 -3
87 -24 112 -21 24 -32 28 -92 31 -50 2 -77 -2 -99 -13z"/>
<path d="M3627 353 c-11 -11 -17 -13 -17 -5 0 8 -16 12 -45 12 l-45 0 0 -125
0 -125 44 0 43 0 6 80 c6 88 19 114 53 107 18 -3 25 2 34 26 8 23 7 33 -2 39
-21 13 -53 9 -71 -9z"/>
<path d="M4208 354 c-16 -8 -28 -10 -28 -4 0 5 -20 10 -45 10 l-45 0 0 -125 0
-125 45 0 45 0 0 69 c0 89 12 123 43 119 21 -3 22 -8 25 -95 l3 -93 49 0 50 0
0 84 c0 64 4 87 16 97 11 9 20 10 32 2 13 -8 18 -29 20 -97 l3 -86 44 0 45 0
0 105 c0 99 -2 107 -25 130 -30 31 -82 33 -116 6 -24 -19 -25 -19 -48 0 -28
23 -75 24 -113 3z"/>
<path d="M4615 355 c-58 -31 -60 -61 -5 -70 30 -5 44 -3 56 10 20 19 69 16 69
-4 0 -10 -24 -21 -68 -32 -82 -21 -107 -40 -107 -85 0 -66 88 -96 158 -54 26
16 32 17 32 5 0 -11 12 -15 46 -15 38 0 45 3 40 16 -3 9 -6 53 -6 99 0 74 -3
87 -24 112 -21 24 -32 28 -92 31 -50 2 -77 -2 -99 -13z"/>
<path d="M5419 347 c-43 -29 -59 -60 -59 -120 0 -40 5 -53 33 -83 27 -30 40
-36 89 -41 66 -7 109 7 138 45 28 35 26 39 -21 47 -35 6 -43 4 -55 -14 -36
-51 -102 -4 -91 65 3 20 11 42 18 50 17 20 56 17 72 -6 12 -17 21 -20 55 -14
l41 6 -15 30 c-30 58 -142 78 -205 35z"/>
<path d="M5753 355 c-97 -42 -95 -200 2 -241 70 -29 150 -9 185 48 27 42 23
126 -6 159 -41 46 -119 61 -181 34z"/>
<path d="M6128 354 c-16 -8 -28 -10 -28 -4 0 5 -20 10 -45 10 l-45 0 0 -125 0
-125 45 0 45 0 0 69 c0 89 12 123 43 119 21 -3 22 -8 25 -95 l3 -93 49 0 50 0
0 84 c0 64 4 87 16 97 11 9 20 10 32 2 13 -8 18 -29 20 -97 l3 -86 44 0 45 0
0 105 c0 99 -2 107 -25 130 -30 31 -82 33 -116 6 -24 -19 -25 -19 -48 0 -28
23 -75 24 -113 3z"/>
<path d="M1760 235 l0 -125 50 0 50 0 0 125 0 125 -50 0 -50 0 0 -125z"/>
<path d="M4890 235 l0 -125 50 0 50 0 0 125 0 125 -50 0 -50 0 0 -125z"/>
</g>
</svg>
    </center>
    </div>
    </form>
</body>
</html>