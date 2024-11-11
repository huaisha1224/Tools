#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#AutoIt3Wrapper_Res_Comment=自动肝Pubg通行证
#AutoIt3Wrapper_Res_Description=自动肝Pubg通行证
#AutoIt3Wrapper_Res_Fileversion=2024.11.11.1
#AutoIt3Wrapper_Res_ProductVersion=1.0.7
#AutoIt3Wrapper_Res_LegalCopyright=怀沙2049
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=None
#AutoIt3Wrapper_Res_Field=ProductName|自动肝Pubg通行证
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
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
#include <WinAPI.au3> ; 包含此库以便使用ShellExecute函数打开URL
#include "WinHttp.au3"
#include <Array.au3>  
#include <Json.au3>  ; 包含 Json.au3 库  




Global $gameNames[5] = ["PUBG：绝地求生 "] ; 全局模式声明游戏名称列表
Global $hWnd, $btnSelect, $btnExit, $btnAbout

Func GatGameWindowSize($GameName)
    ;通过传入的游戏窗口名获取游戏的句柄，最终获取游戏的窗口坐标    
    $hWnd = 0 ; 初始化窗口句柄为未找到
    $hWnd = WinGetHandle($GameName)
    WinActivate($GameName)  ;激活窗口
    ;ConsoleWrite("游戏名称：" &$GameName & "游戏句柄："& $hWnd &@CRLF)
    If $hWnd <> 0 Then
        ; 如果找到窗口句柄，就获取游戏的当前坐标和游戏窗口的大小
        $windowSize = WinGetPos($GameName)
        ;Sleep(10000) ;可选的延时
        Return $windowSize
    EndIf
EndFunc

Func CheckResolution()
	;获取本机的分辨率，并根据分辨率调用不同函数来处理游戏点击操作
	Local $DesktopHeight = @DesktopHeight
	Local $DesktopWidth = @DesktopWidth
	If @DesktopWidth == 1920 And @DesktopHeight == 1080 Then
		MsgBox(1,'肝通行证', '你的分辨率是：'&$DesktopWidth & '*' &$DesktopHeight& ' 即将开始'&@CRLF &"软件免费，自愿使用，风险自担")
		ClickAtGameCenter_1920()
	
	ElseIf @DesktopWidth == 2560 And @DesktopHeight == 1440 Then
		MsgBox(1,'肝通行证',  '你的分辨率是：'&$DesktopWidth & '*' &$DesktopHeight& ' 即将开始'&@CRLF &"软件免费，自愿使用，风险自担")
		ClickAtGameCenter_2560()
	Else
		MsgBox(1,'肝通行证',  '你的分辨率是:'&$DesktopWidth & '*' &$DesktopHeight &' 暂不支持此该分辨率,可联系作者添加')
	EndIf
EndFunc


Func ClickAtGameCenter_1920()
	;通过X和Y坐标以及游戏窗口的宽度和高度计算点击位置并执行点击操作
	;1920*1080分辨率
	While 1 
		MouseMove(236, 966)
		MouseClick("left", 236, 966) 	;开始游戏按钮坐标
		Sleep(10000)
		
		Send("{f down}") ; 保持 F 键按下
		Sleep(500)
		Send("{f up}") ; 释放 F 键 
		
		Sleep(10000)
		Send("{z down}") ; 按下Z键，使玩家处于趴下状态
		
		MouseMove(160, 1015)
		MouseClick("left", 160, 1015) 	;死亡返回大厅
		Sleep(10000)
		
		MouseMove(855, 666)
		MouseClick("left", 855, 666) 	;确认返回
		Sleep(10000)
		
		MouseMove(160, 1015)
		MouseClick("left", 160, 1015) 	;继续/关闭
		Sleep(10000)
	WEnd
EndFunc

Func ClickAtGameCenter_2560()
	;通过X和Y坐标以及游戏窗口的宽度和高度计算点击位置并执行点击操作
	;2560*1440分辨率
	While 1 
		MouseMove(300, 1290)
		MouseClick("left", 300, 1290) 	;开始游戏按钮坐标
		Sleep(10000)
		
		Send("{f down}") ; 保持 F 键按下
		Sleep(500)
		Send("{f up}") ; 释放 F 键 
		
		
		Sleep(10000)
		Send("{z down}") ; 按下Z键，使玩家处于趴下状态
		
		MouseMove(200, 1350)
		MouseClick("left", 200, 1350) 	;死亡返回大厅
		Sleep(10000)
		
		MouseMove(1140, 890)
		MouseClick("left", 1140, 890) 	;确认返回
		Sleep(10000)
		
		MouseMove(200, 1360)
		MouseClick("left", 200, 1360) 	;继续/关闭
		Sleep(10000)
	WEnd
EndFunc

;ClickAtGameCenter()
Func CreateGUI()
    Opt('GuiOneventmode', 1) ; 开启GUI事件驱动模式
	;Opt("GUIEventOptions", 0)
    Global $hWnd
    $hWnd = GUICreate("肝~肝~肝~通行证 1.0.7          	By:怀沙2049	", 430, 220,-1,-1)
	GUISetOnEvent($GUI_EVENT_CLOSE, "ExitApp")             ;注册窗口关闭事件到函数_Exit,必须添加这一行，否则关闭按钮会不能退出程序
	GUISetIcon(@ScriptDir & "\favicon.ico") ; 假设 favicon.ico 与脚本位于同一目录下  
	GUISetState(@SW_SHOW, $hWnd)
    
    $btnSelect = GUICtrlCreateButton("开始", 20, 180, 80, 30)
    GUICtrlSetOnEvent(-1, "CheckResolution")
    
    $btnExit = GUICtrlCreateButton("退出程序", 155, 180, 80, 30)
    GUICtrlSetOnEvent(-1, "ExitApp")
	
	$btnAbout = GUICtrlCreateButton("使用帮助", 290, 180, 80, 30)  
    GUICtrlSetOnEvent(-1, "OpenAboutURL")
	
	$lblDescription = GUICtrlCreateEdit(""&@CRLF& "众所周知Pubg游戏中，单局游戏成活超过3分钟，"&@CRLF& _
				""&@CRLF& "才结算通行证经验，所以工具的功能非常简单"&@CRLF& _
				""&@CRLF& "点击开始游戏坐标，按F键跳伞，死亡后返回大厅"&@CRLF& _
				""&@CRLF& "特别注意：此工具不会使你变得更强，"&@CRLF& _
				""&@CRLF& "注意：目前支持2560*1440以及1920*1080分辨率"&@CRLF& _
				"" ,20, 20, 347, 155)
	
	; 显示 GUI
    GUISetState(@SW_SHOW, $hWnd)
	GetUpdateInfo('PubgPass')
EndFunc

Func ExitApp()
	;退出函数
    GUIDelete()
    Exit
EndFunc

Func OpenAboutURL()
	;打开Url函数
    ShellExecute('https://www.bilibili.com/video/BV1sByBYqEsT')
EndFunc

CreateGUI()
While 1
    Sleep(100) 
WEnd
GUIDelete($hWnd)
Func GetUpdateInfo($ToolName) 
	#cs ----------------------------------------------------------------------------
	用api接口的形式
		1、读取本地执行程序的版本号
		2、通过api接口获取上端配置的版本号
		3、当版本号不一致的时候提示用户进行更新
		$ToolName：工具的名称
		DeadlockBot：Deadlock传火机器人
		PubgPass：pubg自动肝通行证工具
		LiarsBar：骗子酒吧汉化工具
		MicrosoftRewards：微软积分修复工具
		MergeVideos：视频调教工具
		BananaAutoclick：香蕉banana连点器
	#ce ----------------------------------------------------------------------------
    Opt("MustDeclareVars", 1)
	Local $url = 'api.smarttesting.cn'	;api接口地址https://api.smarttesting.cn/tools/BananaAutoclick
    Local $ExePath = @ScriptFullPath
	Local $LocalVersion = FileGetVersion($ExePath)	;获取本文件的版本号
	;MsgBox(4096, "本地版本", $LocalVersion)
	
    ; 初始化并获取会话句柄  
    Local $hOpen = _WinHttpOpen()  
    If @error Then Return MsgBox(0, "错误", "无法初始化会话: " & @error)  
    
    ; 获取连接句柄  
    Local $hConnect = _WinHttpConnect($hOpen, $url)  
    If @error Then Return MsgBox(0, "错误", "无法连接: " & @error)  
    
    ; 发送请求  
    Local $hRequest = _WinHttpSimpleSendRequest($hConnect, "GET", "/tools/"& $ToolName, "Content-Type: application/x-www-form-urlencoded", "")  
    If @error Then Return MsgBox(0, "错误", "发送请求失败: " & @error)  
    
    _WinHttpReceiveResponse($hRequest)  
    
    ; 简单读取响应数据  
    Local $sRead = _WinHttpSimpleReadData($hRequest) 
	;ConsoleWrite($sRead)	
    If @error Then Return MsgBox(0, "错误", "读取响应失败: " & @error)  
    
    ; 解析 JSON 数据  
	Local $Obj = Json_Decode($sRead)
    If @error Then Return MsgBox(0, "错误", "JSON 解析失败: " & @error)  
	
    ; 访问 JSON 对象的字段 ,用Json_Get函数获取JSON里面的内容
	Local $ServerVersion = Json_Get($Obj, '["Version"]')	;获取版本 
	Local $Description = Json_Get($Obj, '["Description"]')	;获取描述
	Local $DownloadUrl = Json_Get($Obj, '["DownloadUrl"]')	;获取下载地址
	;ConsoleWrite("版本："& $ServerVersion &@LF)
	;ConsoleWrite("下载地址：" &$DownloadUrl &@LF)
	;ConsoleWrite("描述：" &$Description &@LF)
	
    ; 关闭句柄  
    _WinHttpCloseHandle($hRequest)  
    _WinHttpCloseHandle($hConnect)  
    _WinHttpCloseHandle($hOpen)  
	
	;调用版本号比较函数
	Local $result = CompareVersions($LocalVersion, $ServerVersion)  
	If $result = -1 Then  
		MsgBox(4096, "发现新版本", "更新 'Pubg肝通行证工具' 到新版本")
		ShellExecute($DownloadUrl)
	EndIf
	
EndFunc  
;$ToolName= 'DeadlockBot'
;UpdateInfo('DeadlockBot')
Func CompareVersions($version1, $version2) 
	#cs ----------------------------------------------------------------------------
		1、将版本号以.进行分割并逐个比较
	#ce ----------------------------------------------------------------------------
	
    Local $v1Parts = StringSplit($version1, ".")  
    Local $v2Parts = StringSplit($version2, ".")  
    
    ; 获取较长的版本部分数  
    Local $maxParts = ($v1Parts[0] > $v2Parts[0]) ? $v1Parts[0] : $v2Parts[0]  

    For $i = 1 To $maxParts  
        Local $v1Value = ($i <= $v1Parts[0]) ? Number($v1Parts[$i]) : 0  
        Local $v2Value = ($i <= $v2Parts[0]) ? Number($v2Parts[$i]) : 0  
        
        If $v1Value > $v2Value Then  
            Return 1 ; version1 大于 version2  
        ElseIf $v1Value < $v2Value Then  
            Return -1 ; version1 小于 version2  
        EndIf  
    Next  
    Return 0 ; 版本相同  
EndFunc  