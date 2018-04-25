; SMTP 메일 발송 스크립트

; 메일 발송을 위한 변수설명
pmsg        := "CDO.Message 오브젝트"
sender      := "발신자 이메일"
senderName  := "발신자 이름"
title       := "메일 제목"
attachFile  := "첨부파일 경로"



; ComObj생성 - CDO.Message
pmsg := ComObjCreate("CDO.Message")

; 발신자 정의
pmsg.From := "" . senderName . " <" . sender . ">"

; 메일 내용
pmsg.Subject  := title          ; 제목
pmsg.TextBody := body           ; 텍스트 본문
pmsg.HtmlBody := body           ; HTML 본문   !텍스트본문이나 HTML본문중 1가지만 사용
pmsg.AddAttachment(attachFile)  ;
