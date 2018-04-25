# Selenium WebDriver
`Selenium Basic API`를 사용한 웹브라우저 자동제어.

※ 본 문서에서는 `Autohotkey`로 `Selenium Basic`을 사용하는 방법을 서술합니다.

※ 모든 예시는 `Google Chrome`을 기반으로 합니다.


## Selenium 다운로드
셀레늄으로 구글 크롬을 자동제어하기 위해선 크게 두가지 요소의 설치가 필요합니다.
1. [Selenium Basic](http://florentbr.github.io/SeleniumBasic/)
2. [Chrome WebDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)


## Selenium Basic 설치하기
1. 다운받은 셀레늄 베이직을 프로그램의 진행에 맞게 설치하여줍니다. 
	- 권장하는 다운로드 설치경로는 `사용자(메인)\AppData\Local` 이나 `C:\progromFile` 입니다.
	
2. 설치 경로안에 있는 `vbsc`를 최초 1회 설치해주세요.
3. 설치 경로안에 최신 `chromedriver`를 넣어주세요.


## Selenium WebDriver 사용하기

### ComObjCreate
`driver`변수 안에 `Selenium.ChromeDriver` 오브젝트를 할당합니다.
```ahk
driver := ComObjCreate( "Selenium.ChromeDriver" )
```

### driver.addArgument
생성된 크롬드라이버 오브젝트의 기본 값을 설정합니다.
```ahk
driver.addArgument( "--incognito" )	; 시크릿 모드 활성화
driver.addArgument( "--headless" )	; 크롬창 숨기기
```
더욱 다양한 커맨드값들은 [다음](https://peter.sh/experiments/chromium-command-line-switches/)사이트에 자세히 기술되어 있습니다.

### driver.get
구글크롬을 원하는 URL 로 이동시킵니다.
```ahk
driver.Get( "https://www.example.com" )
```
### 웹페이지 제어
`HTML TAG` 요소를 사용하여 웹페이지를 제어합니다.
```ahk
; ID 값을 사용한 웹제어
driver.findElementByID( "idName" )

; Class 값을 사용한 웹제어
driver.findElementsByClassName( "className" ).item["번호"]
```

