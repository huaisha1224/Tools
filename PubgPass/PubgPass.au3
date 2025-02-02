#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#AutoIt3Wrapper_Res_Comment=�Զ���Pubgͨ��֤
#AutoIt3Wrapper_Res_Description=�Զ���Pubgͨ��֤
#AutoIt3Wrapper_Res_Fileversion=2025.2.1.1
#AutoIt3Wrapper_Res_ProductVersion=1.1.7
#AutoIt3Wrapper_Res_LegalCopyright=��ɳ2049
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=None
#AutoIt3Wrapper_Res_Field=ProductName|�Զ���Pubgͨ��֤
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** ���������� ACNWrapper_GUI ****
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#NoTrayIcon
#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <FileConstants.au3>
#include <Misc.au3>
#include <Date.au3>
#include <File.au3>
#include <WinAPI.au3> ; �����˿��Ա�ʹ��ShellExecute������URL
#include "WinHttp.au3"
#include <Array.au3>  
#include <Json.au3>  ; ���� Json.au3 ��  

#cs ----------------------------------------------------------------------------
2024-11-14���£�	���Ӱ���ݼ�Ctrl+Q�˳�����Ĺ���
2024-11-29���£�	����֧��1920*1200�ķֱ���
2024-11-30���£� 	�޸�2560*1440�ֱ��ʵĿ�ʼ��ť���겻׼ȷ�����»����л���ͼ
2024-12-06���£�	�޸��°汾��Ϸ���װ�����������ҳ������⣬��2��ESC
2025-01-15���£�	����2025-1-15�ո��µ�PUBG�汾
2025-01-21���£�	֧��1728*1080�ֱ���
2025-02-01���£�	֧�ְ�=�Զ�����
����֧��2304*1440�ֱ���


#ce ----------------------------------------------------------------------------


Global $gameNames[5] = ["PUBG���������� "] ; ȫ��ģʽ������Ϸ�����б�
Global $hWnd, $btnSelect, $btnExit, $btnAbout

Func GatGameWindowSize($GameName)
    ;ͨ���������Ϸ��������ȡ��Ϸ�ľ�������ջ�ȡ��Ϸ�Ĵ�������    
    $hWnd = 0 ; ��ʼ�����ھ��Ϊδ�ҵ�
    $hWnd = WinGetHandle($GameName)
    WinActivate($GameName)  ;�����
    ;ConsoleWrite("��Ϸ���ƣ�" &$GameName & "��Ϸ�����"& $hWnd &@CRLF)
    If $hWnd <> 0 Then
        ; ����ҵ����ھ�����ͻ�ȡ��Ϸ�ĵ�ǰ�������Ϸ���ڵĴ�С
        $windowSize = WinGetPos($GameName)
        ;Sleep(10000) ;��ѡ����ʱ
        Return $windowSize
    EndIf
EndFunc

Func CheckResolution()
	;��ȡ�����ķֱ��ʣ������ݷֱ��ʵ��ò�ͬ������������Ϸ�������
	Local $DesktopHeight = @DesktopHeight
	Local $DesktopWidth = @DesktopWidth
	If @DesktopWidth == 1920 And @DesktopHeight == 1080 Then
		MsgBox(1,'��ͨ��֤', '��ķֱ����ǣ�'&$DesktopWidth & '*' &$DesktopHeight& ' ������ʼ'&@CRLF &"�����ѣ���Ըʹ�ã������Ե�")
		ClickAtGameCenter_1920()
	
	ElseIf @DesktopWidth == 2560 And @DesktopHeight == 1440 Then
		MsgBox(1,'��ͨ��֤',  '��ķֱ����ǣ�'&$DesktopWidth & '*' &$DesktopHeight& ' ������ʼ'&@CRLF &"�����ѣ���Ըʹ�ã������Ե�")
		ClickAtGameCenter_2560()
	
	ElseIf @DesktopWidth == 1920 And @DesktopHeight == 1200 Then
		MsgBox(1,'��ͨ��֤',  '��ķֱ����ǣ�'&$DesktopWidth & '*' &$DesktopHeight& ' ������ʼ'&@CRLF &"�����ѣ���Ըʹ�ã������Ե�")
		ClickAtGameCenter_1200()
	
	ElseIf @DesktopWidth == 1728 And @DesktopHeight == 1080 Then
		MsgBox(1,'��ͨ��֤',  '��ķֱ����ǣ�'&$DesktopWidth & '*' &$DesktopHeight& ' ������ʼ'&@CRLF &"�����ѣ���Ըʹ�ã������Ե�")
		ClickAtGameCenter_1728()
	Else
		MsgBox(1,'��ͨ��֤',  '��ķֱ�����:'&$DesktopWidth & '*' &$DesktopHeight &' �ݲ�֧�ִ˸÷ֱ���,����ϵ�������')
	EndIf
EndFunc

Func AutoRuning()
	;��=ʵ���Զ����ܹ���
	Send("{= down}")
	Sleep(500)
	Send("{= up}")
	Sleep(1000)
EndFunc


Func ClickAtGameCenter_1728()
	;ͨ��X��Y�����Լ���Ϸ���ڵĿ�Ⱥ͸߶ȼ�����λ�ò�ִ�е������
	;1728*1080�ֱ���
	While 1 
		;AutoRuning()	;�Զ����ܹ���
		
		;��ʼ��Ϸ��ť����
		MouseMove(230, 925)
		MouseClick("left", 230, 925) 	;��ʼ��Ϸ��ť����
		Sleep(10000)
		
		Send("{f down}") ; ���� F ������
		Sleep(500)
		Send("{f up}") ; �ͷ� F �� 
		
		Sleep(10000)
		Send("{z down}") ; ����Z����ʹ��Ҵ���ſ��״̬
		Sleep(500)
		Send("{z up}") ; �ͷ� F �� 
		
		MouseMove(170, 1015)
		MouseClick("left", 170, 1015) 	;�������ش���
		Sleep(10000)
		
		MouseMove(760, 666)
		MouseClick("left", 760, 666) 	;ȷ�Ϸ���
		Sleep(10000)
		
		;��2��ESC����������򿪸�������ҳ�������
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		Sleep(500)
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		
		MouseMove(150, 970)
		MouseClick("left", 150, 970) 	;����/�ر�
		Sleep(10000)
	WEnd
EndFunc

Func ClickAtGameCenter_1920()
	;ͨ��X��Y�����Լ���Ϸ���ڵĿ�Ⱥ͸߶ȼ�����λ�ò�ִ�е������
	;1920*1080�ֱ���
	While 1 
		;AutoRuning()	;�Զ����ܹ���
		
		;��ʼ��Ϸ��ť����
		MouseMove(236, 966)
		MouseClick("left", 236, 966) 	;��ʼ��Ϸ��ť����
		Sleep(10000)
		
		Send("{f down}") ; ���� F ������
		Sleep(500)
		Send("{f up}") ; �ͷ� F �� 
		
		Sleep(10000)
		Send("{z down}") ; ����Z����ʹ��Ҵ���ſ��״̬
		Sleep(500)
		Send("{z up}") ; �ͷ� F �� 
		
		MouseMove(160, 1015)
		MouseClick("left", 160, 1015) 	;�������ش���
		Sleep(10000)
		
		MouseMove(855, 666)
		MouseClick("left", 855, 666) 	;ȷ�Ϸ���
		Sleep(10000)
		
		;��2��ESC����������򿪸�������ҳ�������
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		Sleep(500)
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		
		MouseMove(160, 1015)
		MouseClick("left", 160, 1015) 	;����/�ر�
		Sleep(10000)
	WEnd
EndFunc



Func ClickAtGameCenter_1200()
	;ͨ��X��Y�����Լ���Ϸ���ڵĿ�Ⱥ͸߶ȼ�����λ�ò�ִ�е������
	;1920*1200�ֱ���
	While 1 
		;AutoRuning()	;�Զ����ܹ���
		
		;��ʼ��Ϸ��ť����
		MouseMove(250, 1030)
		MouseClick("left", 250, 1030) 	;��ʼ��Ϸ��ť����
		Sleep(10000)
		
		Send("{f down}") ; ���� F ������
		Sleep(500)
		Send("{f up}") ; �ͷ� F �� 
		
		Sleep(10000)
		Send("{z down}") ; ����Z����ʹ��Ҵ���ſ��״̬
		Sleep(500)
		Send("{z up}") ; �ͷ� F �� 
		
		
		MouseMove(200, 1130)
		MouseClick("left", 200, 1130) 	;�������ش���
		Sleep(10000)
		
		MouseMove(840, 740)
		MouseClick("left", 840, 740) 	;ȷ�Ϸ���
		Sleep(10000)
		
		;��2��ESC����������򿪸�������ҳ�������
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		Sleep(500)
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		
		MouseMove(150, 1080)
		MouseClick("left", 150, 1080) 	;����/�ر�
		Sleep(10000)
	WEnd
EndFunc

Func ClickAtGameCenter_2560()
	;ͨ��X��Y�����Լ���Ϸ���ڵĿ�Ⱥ͸߶ȼ�����λ�ò�ִ�е������
	;2560*1440�ֱ���
	While 1 
		;AutoRuning()	;�Զ����ܹ���
		
		;��ʼ��Ϸ��ť����
		MouseMove(300, 1290)
		MouseClick("left", 300, 1290) 	;��ʼ��Ϸ��ť����
		Sleep(10000)
		
		Send("{f down}") ; ���� F ������
		Sleep(500)
		Send("{f up}") ; �ͷ� F �� 
		
		
		Sleep(10000)
		Send("{z down}") ; ����Z����ʹ��Ҵ���ſ��״̬
		Sleep(500)
		Send("{z up}") ; �ͷ� F �� 
		
		
		MouseMove(200, 1350)
		MouseClick("left", 200, 1350) 	;�������ش���
		Sleep(10000)
		
		MouseMove(1140, 890)
		MouseClick("left", 1140, 890) 	;ȷ�Ϸ���
		Sleep(10000)
		
		;��2��ESC����������򿪸�������ҳ�������
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		Sleep(500)
		Send("{ESC down}") ; ����ESC����
		Sleep(500)
		Send("{ESC up}") ; �ͷ� ESC �� 
		
		MouseMove(200, 1360)
		MouseClick("left", 200, 1360) 	;����/�ر�
		Sleep(10000)
	WEnd
EndFunc

;ClickAtGameCenter()
Func CreateGUI()
    Opt('GuiOneventmode', 1) ; ����GUI�¼�����ģʽ
	;Opt("GUIEventOptions", 0)
    Global $hWnd
    $hWnd = GUICreate("��~��~��~ͨ��֤ 1.1.7          	By:��ɳ2049	", 480, 285,-1,-1)
	GUISetOnEvent($GUI_EVENT_CLOSE, "ExitApp")             ;ע�ᴰ�ڹر��¼�������_Exit,���������һ�У�����رհ�ť�᲻���˳�����
	GUISetIcon(@ScriptDir & "\favicon.ico") ; ���� favicon.ico ��ű�λ��ͬһĿ¼��  
	GUISetState(@SW_SHOW, $hWnd)
    
    $btnSelect = GUICtrlCreateButton("��ʼ", 20, 250, 80, 30)
    GUICtrlSetOnEvent(-1, "CheckResolution")
    
    $btnExit = GUICtrlCreateButton("���ⷴ��", 170, 250, 80, 30)
    GUICtrlSetOnEvent(-1, "ContactMe")
	
	$btnAbout = GUICtrlCreateButton("ʹ�ð���", 318, 250, 80, 30)  
    GUICtrlSetOnEvent(-1, "OpenAboutURL")
	
	$lblDescription = GUICtrlCreateEdit(""&@CRLF& "Pubg��Ϸ��,������Ϸ�ɻ��3����,�Ž���ͨ��֤����"&@CRLF& _
				""&@CRLF& "���Թ��ߵĹ��ܷǳ���,ͨ���������������ʵ��"&@CRLF& _
				""&@CRLF& "��ʼ��Ϸ,��ɡ,���ش�����.���Ա���Ҫ����ֱ���"&@CRLF& _
				""&@CRLF& "֧�ֱַ��ʣ�2560*1440��1920*1080��1920*1200����1728*1080"&@CRLF& _
				""&@CRLF& "�˳���ݼ���ͬʱ�� Alt+Q �����˳��ͻ���"&@CRLF& _
				""&@CRLF& " "&@CRLF& _
				""&@CRLF& "�������ȫ��ѣ��Ͻ�����;Bվ������ע���Ƕ�������֧��"&@CRLF& _
				""&@CRLF& "�˹��߲���ʹ���ø�ǿ,ʹ�ô˹��ߵķ��������Լ��е�"&@CRLF& _
				"" ,20, 20, 380, 220,$WS_EX_STATICEDGE)
	
	; ��ʾ GUI
    GUISetState(@SW_SHOW, $hWnd)
	
	HotKeySet("!q", "ExitApp") 	; Alt + Q �˳����� 
	GetUpdateInfo('PubgPass')	; ������
EndFunc

Func ExitApp()
	;�˳�����
    GUIDelete()
    Exit
EndFunc

Func ContactMe()
	;��ϵ��
	ShellExecute('https://qm.qq.com/q/G8j6dhrFEk') ;��Ⱥ��ϵ
EndFunc

Func OpenAboutURL()
	;��Url����
    ShellExecute('https://www.bilibili.com/video/BV1sByBYqEsT')
EndFunc

CreateGUI()
While 1
    Sleep(100) 
WEnd
GUIDelete($hWnd)
Func GetUpdateInfo($ToolName) 
	#cs ----------------------------------------------------------------------------
	��api�ӿڵ���ʽ
		1����ȡ����ִ�г���İ汾��
		2��ͨ��api�ӿڻ�ȡ�϶����õİ汾��
		3�����汾�Ų�һ�µ�ʱ����ʾ�û����и���
		$ToolName�����ߵ�����
		DeadlockBot��Deadlock���������
		PubgPass��pubg�Զ���ͨ��֤����
		LiarsBar��ƭ�Ӿưɺ�������
		MicrosoftRewards��΢������޸�����
		MergeVideos����Ƶ���̹���
		BananaAutoclick���㽶banana������
	#ce ----------------------------------------------------------------------------
    Opt("MustDeclareVars", 1)
	Local $url = 'api.smarttesting.cn'	;api�ӿڵ�ַhttps://api.smarttesting.cn/tools/BananaAutoclick
    Local $ExePath = @ScriptFullPath
	Local $LocalVersion = FileGetVersion($ExePath)	;��ȡ���ļ��İ汾��
	;MsgBox(4096, "���ذ汾", $LocalVersion)
	
    ; ��ʼ������ȡ�Ự���  
    Local $hOpen = _WinHttpOpen()  
    If @error Then Return MsgBox(0, "����", "�޷���ʼ���Ự: " & @error)  
    
    ; ��ȡ���Ӿ��  
    Local $hConnect = _WinHttpConnect($hOpen, $url)  
    If @error Then Return MsgBox(0, "����", "�޷�����: " & @error)  
    
    ; ��������  
    Local $hRequest = _WinHttpSimpleSendRequest($hConnect, "GET", "/tools/"& $ToolName, "Content-Type: application/x-www-form-urlencoded", "")  
    If @error Then Return MsgBox(0, "����", "��������ʧ��: " & @error)  
    
    _WinHttpReceiveResponse($hRequest)  
    
    ; �򵥶�ȡ��Ӧ����  
    Local $sRead = _WinHttpSimpleReadData($hRequest) 
	;ConsoleWrite($sRead)	
    If @error Then Return MsgBox(0, "����", "��ȡ��Ӧʧ��: " & @error)  
    
    ; ���� JSON ����  
	Local $Obj = Json_Decode($sRead)
    If @error Then Return MsgBox(0, "����", "JSON ����ʧ��: " & @error)  
	
    ; ���� JSON ������ֶ� ,��Json_Get������ȡJSON���������
	Local $ServerVersion = Json_Get($Obj, '["Version"]')	;��ȡ�汾 
	Local $Description = Json_Get($Obj, '["Description"]')	;��ȡ����
	Local $DownloadUrl = Json_Get($Obj, '["DownloadUrl"]')	;��ȡ���ص�ַ
	;ConsoleWrite("�汾��"& $ServerVersion &@LF)
	;ConsoleWrite("���ص�ַ��" &$DownloadUrl &@LF)
	;ConsoleWrite("������" &$Description &@LF)
	
    ; �رվ��  
    _WinHttpCloseHandle($hRequest)  
    _WinHttpCloseHandle($hConnect)  
    _WinHttpCloseHandle($hOpen)  
	
	;���ð汾�űȽϺ���
	Local $result = CompareVersions($LocalVersion, $ServerVersion)  
	If $result = -1 Then  
		MsgBox(4096, "�����°汾", "���� 'Pubg��ͨ��֤����' ���°汾")
		ShellExecute($DownloadUrl)
	EndIf
	
EndFunc  
;$ToolName= 'DeadlockBot'
;UpdateInfo('DeadlockBot')
Func CompareVersions($version1, $version2) 
	#cs ----------------------------------------------------------------------------
		1�����汾����.���зָ����Ƚ�
	#ce ----------------------------------------------------------------------------
	
    Local $v1Parts = StringSplit($version1, ".")  
    Local $v2Parts = StringSplit($version2, ".")  
    
    ; ��ȡ�ϳ��İ汾������  
    Local $maxParts = ($v1Parts[0] > $v2Parts[0]) ? $v1Parts[0] : $v2Parts[0]  

    For $i = 1 To $maxParts  
        Local $v1Value = ($i <= $v1Parts[0]) ? Number($v1Parts[$i]) : 0  
        Local $v2Value = ($i <= $v2Parts[0]) ? Number($v2Parts[$i]) : 0  
        
        If $v1Value > $v2Value Then  
            Return 1 ; version1 ���� version2  
        ElseIf $v1Value < $v2Value Then  
            Return -1 ; version1 С�� version2  
        EndIf  
    Next  
    Return 0 ; �汾��ͬ  
EndFunc  