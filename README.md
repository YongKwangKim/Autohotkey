# Autohotkey
오토핫키로 자주 사용되는 스크립트들을 모아둔 Repository 입니다.

1. Selenium WebDriver
2. winHTTP 통신
3. CDO.Message

## Selenium WebDriver
Selenium Basic을 통한 브라우져 제어 

## WinHTTP 통신
winHttp를 통한 웹 파싱

## CDO.Message
SMTP 방식의 이메일 보내기

```ahk

; 메일 발송을 위한 변수설명
pmsg        := "CDO.Message 오브젝트"
sender      := "발신자 이메일"
senderName  := "발신자 이름"
pass        := "발신자 비밀번호"
receiver    := "수신자"
title       := "메일 제목"
attachFile  := "첨부파일 경로"

; ComObj생성 - CDO.Message
pmsg := ComObjCreate("CDO.Message")

; 발신자 정의
pmsg.From := "" . senderName . " <" . sender . ">"

; 수신자 정의
pmsg.To   := receiver           ; 수신자
pmsg.BCC  := ""                 ; 참조
pmsg.CC   := ""                 ; 숨은참조

; 메일 내용
pmsg.Subject  := title          ; 제목
pmsg.TextBody := body           ; 텍스트 본문
pmsg.HtmlBody := body           ; HTML 본문         ! 텍스트본문이나 HTML본문중 1가지만 사용
pmsg.AddAttachment(attachFile)  ; 첨부파일

; 필드 오브젝트 생성
fields := Object()

fields.smtpserver := "smtp.gmail.com"		; 구  글 SMTP
fields.smtpserver := "smtp.daum.net"		; 다  음 SMTP
fields.smtpserver := "smtp.naver.com"		; 네이버 SMTP		  ! 발신자 이메일에 맞는 SMTP 서버사용
fields.smtpserverport := 465		            ; 보안연결(SSL)필요	! 네이버, 구글, 다음 공통
fields.smtpusessl := True 	            ; False
fields.sendusing  := 2   		            ; cdoSendUsingPort
fields.smtpauthenticate := 1   		            ; cdoBasic
fields.sendusername := sender	            ; 보내는 계정 아이디
fields.sendpassword := pass		            ; 보내는 계정 비밀번호
fields.smtpconnectiontimeout  := 60                   ; 통신 타임아웃
schema  := "http://schemas.microsoft.com/cdo/configuration/"

; 메일 세팅 업데이트
pfld :=   pmsg.Configuration.Fields
For field,value in fields
  pfld.Item(schema . field) := value
pfld.Update()

; 메일 전송
pmsg.Send()
```
