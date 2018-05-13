VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Main window"
   ClientHeight    =   5190
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8055
   LinkTopic       =   "Form1"
   ScaleHeight     =   5190
   ScaleWidth      =   8055
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox noise 
      Height          =   285
      Left            =   4320
      TabIndex        =   9
      Text            =   "0"
      Top             =   1800
      Width           =   975
   End
   Begin VB.TextBox dScale 
      Height          =   375
      Left            =   1800
      TabIndex        =   8
      Text            =   "2"
      Top             =   1800
      Width           =   975
   End
   Begin VB.TextBox locout 
      Height          =   375
      Left            =   480
      TabIndex        =   7
      Text            =   "C:\"
      Top             =   4440
      Width           =   3975
   End
   Begin VB.TextBox locin 
      Height          =   375
      Left            =   480
      TabIndex        =   6
      Text            =   "C:\"
      Top             =   3480
      Width           =   3975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "make Batch file"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   0
      Top             =   3960
      Width           =   2775
   End
   Begin VB.Label L6 
      Caption         =   "Label6"
      Height          =   375
      Left            =   9600
      TabIndex        =   10
      Top             =   1200
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "output location"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   480
      TabIndex        =   5
      Top             =   4080
      Width           =   1290
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "input location"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   480
      TabIndex        =   4
      Top             =   3000
      Width           =   1170
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "noise level"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4320
      TabIndex        =   3
      Top             =   1440
      Width           =   975
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "scale factor"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1800
      TabIndex        =   2
      Top             =   1440
      Width           =   1035
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Waifu2X OpenCL variante GUI"
      BeginProperty Font 
         Name            =   "DejaVu Serif"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   1080
      TabIndex        =   1
      Top             =   360
      Width           =   5415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim s As String
Dim P As String
Dim arg As String
If noise.Text = 0 Then
arg = " -i " + locin.Text + " -o " + locout.Text + " --scale_ratio " + dScale.Text + " -m scale"
s = ".\waifu2x-converter-cpp.exe" + arg
Else
arg = " -i " + locin.Text + " -o " + locout.Text + " --scale_ratio " + dScale.Text + " -m noise_scale " + " --noise_level " + noise.Text
s = ".\waifu2x-converter-cpp.exe" + arg
End If
Dim iFileNo As Integer
iFileNo = FreeFile
Open ".\RunMe.bat" For Output As #iFileNo
Print #iFileNo, s
Close #iFileNo
MsgBox "you can now double click on RunMe.bat to run waifu2X as programmed here", vbExclamation
End Sub
