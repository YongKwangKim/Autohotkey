# Selenium WebDriver
`Selenium Basic API`를 사용한 웹브라우저 자동제어.

※ 본 문서에서는 `Autohotkey`로 `Selenium Basic`을 사용하는 방법을 서술합니다.

※ 다운로드/설치 예시는 `Google Chrome`을 기반으로 합니다.


## Selenium 다운로드
오토핫키로 셀레늄을 제어하기 위해서는 Selenium Basic 을 설치하여야 합니다. 현재 최신 업데이트 버젼은 2.0.9.0이며 여기를 통해 다운받으실 수 있습니다. 구글 크롬을 자동제어하기 위해선 크게 두가지 요소의 설치가 필요합니다.

In order to control Selenium with AutoHotkey you need to install the SeleniumBasic.  The current version is 2.09.0 and can be downloaded here.  Selenium is now on version 3 and there is a new SeleniumBasic version promised to be released soon which will connect to version 3 of Selenium.  Make sure you download the WebDrivers of choice for your browsers.
1. [Selenium Basic](http://florentbr.github.io/SeleniumBasic/)
2. [Chrome WebDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)


## Selenium Basic 설치하기
1. 다운받은 셀레늄 베이직을 프로그램의 진행에 맞게 설치하여줍니다. 
	- 권장하는 다운로드 설치경로는 `사용자(메인)\AppData\Local` 이나 `C:\progromFile` 입니다.
	
2. 설치 경로안에 있는 `vbsc`를 최초 1회 설치해주세요.
3. 설치 경로안에 최신 `chromedriver`를 넣어주세요.


## Selenium WebDriver 사용하기

### ComObjCreate
`driver`변수 안에 `driver` 오브젝트를 할당합니다.
```ahk
driver := ComObjCreate("Selenium.ChromeDriver")
driver := ComObjCreate("Selenium.IEDriver")
driver := ComObjCreate("Selenium.FireFoxDriver")
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
### driver.findElementBy
`HTML`의 element 값을 찾습니다.
```ahk
; ID
driver.findElementByID("ID")

; Class
driver.findElementsByClassName("ClassName").item["번호"] ; 1번부터 시작

; Name
driver.findElementsByName("Name").item["번호"] ; 1번부터 시작
driver.findElementByName("Name")

; Tag Name
driver.findElementsByTagName("TagName").item["번호"] ; 1번부터 시작
driver.findElementByTagName("TagName")
```

### 페이지에서 정보 파싱
제어하고있는 크롬안의 정보를 불러옵니다.


