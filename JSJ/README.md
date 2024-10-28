# FINAL PROJECT_그룹웨어 시스템

<div align="center">
<img width="329" alt="image" src="https://raw.githubusercontent.com/jsj5100/RGB_Project/main/Grw_Project/src/main/webapp/img/jsj1.jpg">

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fjsj5100%2FRGB_Project%2Ftree%2Fmain&count_bg=%23FF9999&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

</div>

# Grw_Project
> **구디아카데미 Spring 기반 프로젝트** <br/> **개발기간: 2024.08.18 ~ 2024.09.08**

## 개발팀 소개

|      조홍준       |          김유진         |       명대홍         |      양승      |      전성진      |
| :------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------: |
|   <img width="160px" src="https://avatars.githubusercontent.com/u/144213397?v=4" />    | <img width="160px" src="https://avatars.githubusercontent.com/u/173423276?v=4" /> | <img width="160px" src="https://avatars.githubusercontent.com/u/173789619?v=4"/> | <img width="160px" src="https://avatars.githubusercontent.com/u/110274414?v=4"/> | <img width="160px" src="https://avatars.githubusercontent.com/u/119272401?v=4"/> |
|   [@Goodgaring](https://github.com/Goodgaring)   |    [@SnowGlobe827](https://github.com/SnowGlobe827)  | [@da2hong](https://github.com/da2hong)  | [@SeongE1](https://github.com/SeongE1) | [@jsj5100](https://github.com/jsj5100) |

## 프로젝트 소개
- **이름**: "RGB"
- **기간**: 2024.08.18 ~ 2024.09.08
- **인원**: 5명
- **목표**: 서버에서 기업의 업무 지원 프로세스를 자동화할 수 있는 ERD 그룹웨어 기능 구현 (전자결재, 일정 관리, 근태 관리, 인사 관리)

## 개발 환경
- **언어**: Java, HTML5, CSS3, JavaScript, JSP
- **라이브러리**: jQuery, JSTL, Spring Security, jstree...
- **프레임워크**: Spring Framework, MyBatis, Bootstrap
- **데이터베이스**: Oracle DB
- **운영체제**: Windows 11
- **IDE**: Eclipse
- **버전 관리**: Git & GitHub

#### Project Overview
- **Name**: "RGB"
- **Duration**: 2024.08.18 ~ 2024.09.08
- **Team Size**: 4 members
- **Objective**: Implement groupware features to automate business support processes on the server, including electronic approval, schedule management, attendance management, and human resource management.

#### Development Environment
- **Languages**: Java, HTML5, CSS3, JavaScript, JSP
- **Libraries**: jQuery, JSTL, Spring Security, jstree...
- **Frameworks**: Spring Framework, MyBatis, Bootstrap
- **Database**: Oracle DB
- **Operating System**: Windows 11
- **IDE**: Eclipse
- **Version Control**: Git & GitHub

## 시작 가이드
### Requirements
For building and running the application you need:

- [Eclipse IDE 2022-03](https://www.eclipse.org/downloads/packages/release/2022-03/r)
- [Tomcat 10.0.27](https://tomcat.apache.org/tomcat-10.0-doc/changelog.html)

### Installation
``` bash
$ git clone https://github.com/jsj5100/RGB_Project.git
$ cd RGB_Project
```
#### Oracle DB
```
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:xe
spring.datasource.username=RGB
spring.datasource.password=RGB
```


---

## Stacks 🐈

### Environment
![Eclipse IDE](https://img.shields.io/badge/Eclipse%20IDE-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white)

### Config
![DBeaver](https://img.shields.io/badge/DBeaver-1F8ACB?style=for-the-badge&logo=DBeaver&logoColor=white)
![Oracle DB](https://img.shields.io/badge/Oracle%20DB-F80000?style=for-the-badge&logo=Oracle&logoColor=white)
![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=for-the-badge&logo=Apache%20Tomcat&logoColor=white)

### Development
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=Javascript&logoColor=white)
![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white)
![Spring Framework](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white)

### Communication
![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=Slack&logoColor=white)
![Google Meet](https://img.shields.io/badge/Google%20Meet-00897B?style=for-the-badge&logo=Google%20Meet&logoColor=white)

---

# 프로젝트 담당 부분
## 인사 관리, 근태 관리
1. **요구사항 정의 및 문서 작업**: 
   - 요구사항 정의, WBS(Work Breakdown Structure) 작성, 테이블 설계 등 프로젝트 기초 확립
2. **데이터베이스 설계**: 
   - Oracle DB를 사용해 인사 정보, 근태 정보(출퇴근 시간 기록), 직위, 권한, 부서 관리를 위한 테이블 설계. 정규화 및 데이터 무결성 고려
3. **UI/UX 설계**: 
   - HTML/CSS, Bootstrap, XML, AJAX 등 사용하여 사용자 인터페이스 설계

#### Responsibilities: [HR Management, Attendance Management]
1. **Requirement Definition and Documentation**: 
   - Defined requirements, created WBS (Work Breakdown Structure), designed tables, and established the project's foundation.
2. **Database Design**: 
   - Designed tables in Oracle DB for managing employee information, attendance records (clock-in/clock-out), job titles, permissions, and departments, considering normalization and data integrity.
3. **UI/UX Design**: 
   - Designed the user interface using HTML/CSS.

## 화면 구성 📺
| 로그인 페이지  |  메인 페이지   | 
| :-------------------------------------------: | :------------: |
|  <img width="329" src="https://github.com/jsj5100/RGB_Project/blob/main/JSJ/%EB%A1%9C%EA%B7%B8%EC%9D%B8.png?raw=true"/> |  <img width="329" src="https://github.com/jsj5100/RGB_Project/blob/main/JSJ/%EB%A9%94%EC%9D%B8.png?raw=true"/>|  
| 마이 페이지   |  근태 페이지   |  
| <img width="329" src="https://github.com/jsj5100/RGB_Project/blob/main/JSJ/%EB%A7%88%EC%9D%B4.png?raw=true"/>   |  <img width="329" src="https://github.com/jsj5100/RGB_Project/blob/main/JSJ/%EA%B7%BC%ED%83%9C.png?raw=true"/>     |

# 시행 영상 📺
(https://img.youtube.com/vi/aKF6aAuev_c/0.jpg)](https://www.youtube.com/watch?v=aKF6aAuev_c)

---
## 주요 기능 📦

### ⭐️ 로그인 페이지
- Spring Security를 이용한 PasswordEncoder/CSRF 로그인 기능
- 관리자에게 문의 기능
- 암호 찾기 기능
- 이메일 인증 기능

### ⭐️ 메인 페이지
- 로그인한 사용자의 근태현황 확인 가능 및 출퇴근 기능

### ⭐️ 마이 페이지
- 개인정보 확인 및 수정 / 관리자가 사용자의 개인정보 확인 및 수정

### ⭐️ 근태 페이지
- 개인 출퇴 확인 및 수정 / 관리자가 사용자의 출퇴 확인 및 수정

---
## 아키텍쳐

### 디렉토리 구조
```bash
├── README.md
├── package-lock.json
├── package.json
├── strapi-backend : 
│   ├── README.md
│   ├── api : db model, api 관련 정보 폴더
│   │   ├── about
│   │   ├── course
│   │   └── lecture
│   ├── config : 서버, 데이터베이스 관련 정보 폴더
│   │   ├── database.js
│   │   ├── env : 배포 환경(NODE_ENV = production) 일 때 설정 정보 폴더
│   │   ├── functions : 프로젝트에서 실행되는 함수 관련 정보 폴더
│   │   └── server.js
│   ├── extensions
│   │   └── users-permissions : 권한 정보
│   ├── favicon.ico
│   ├── package-lock.json
│   ├── package.json
│   └── public
│       ├── robots.txt
│       └── uploads : 강의 별 사진
└── voluntain-app : 프론트엔드
    ├── README.md
    ├── components
    │   ├── CourseCard.js
    │   ├── Footer.js
    │   ├── LectureCards.js
    │   ├── MainBanner.js : 메인 페이지에 있는 남색 배너 컴포넌트, 커뮤니티 이름과 슬로건을 포함.
    │   ├── MainCard.js
    │   ├── MainCookieCard.js
    │   ├── NavigationBar.js : 네비게이션 바 컴포넌트, _app.js에서 공통으로 전체 페이지에 포함됨.
    │   ├── RecentLecture.js
    │   └── useWindowSize.js
    ├── config
    │   └── next.config.js
    ├── lib
    │   ├── context.js
    │   └── ga
    ├── next.config.js
    ├── package-lock.json
    ├── package.json
    ├── pages
    │   ├── _app.js
    │   ├── _document.js
    │   ├── about.js
    │   ├── course
    │   ├── index.js
    │   ├── lecture
    │   ├── newcourse
    │   ├── question.js
    │   └── setting.js
    ├── public
    │   ├── favicon.ico
    │   └── logo_about.png
    └── styles
        └── Home.module.css

```

<!--
```bash
├── README.md : 리드미 파일
│
├── strapi-backend/ : 백엔드
│   ├── api/ : db model, api 관련 정보 폴더
│   │   └── [table 이름] : database table 별로 분리되는 api 폴더 (table 구조, 해당 table 관련 api 정보 저장)
│   │       ├── Config/routes.json : api 설정 파일 (api request에 따른 handler 지정)
│   │       ├── Controllers/ [table 이름].js : api controller 커스텀 파일
│   │       ├── Models : db model 관련 정보 폴더
│   │       │   ├── [table 이름].js : (사용 X) api 커스텀 파일
│   │       │   └── [table 이름].settings.json : model 정보 파일 (field 정보)
│   │       └─── Services/ course.js : (사용 X) api 커스텀 파일
│   │ 
│   ├── config/ : 서버, 데이터베이스 관련 정보 폴더
│   │   ├── Env/production : 배포 환경(NODE_ENV = production) 일 때 설정 정보 폴더
│   │   │   └── database.js : production 환경에서 database 설정 파일
│   │   ├── Functions : 프로젝트에서 실행되는 함수 관련 정보 폴더
│   │   │   │   ├── responses : (사용 X) 커스텀한 응답 저장 폴더
│   │   │   │   ├── bootstrap.js : 어플리케이션 시작 시 실행되는 코드 파일
│   │   │   │   └── cron.js : (사용 X) cron task 관련 파일
│   │   ├── database.js : 기본 개발 환경(NODE_ENV = development)에서 database 설정 파일
│   │   └── server.js : 서버 설정 정보 파일
│   │  
│   ├── extensions/
│   │   └── users-permissions/config/ : 권한 정보
│   │ 
│   └── public/
│       └── uploads/ : 강의 별 사진
│
└── voluntain-app/ : 프론트엔드
    ├── components/
    │   ├── NavigationBar.js : 네비게이션 바 컴포넌트, _app.js에서 공통으로 전체 페이지에 포함됨.
    │   ├── MainBanner.js : 메인 페이지에 있는 남색 배너 컴포넌트, 커뮤니티 이름과 슬로건을 포함.
    │   ├── RecentLecture.js : 사용자가 시청 정보(쿠키)에 따라, 현재/다음 강의를 나타내는 컴포넌트 [호출: MainCookieCard]
    │   ├── MainCookieCard.js : 상위 RecentLecture 컴포넌트에서 전달받은 props를 나타내는 레이아웃 컴포넌트.
    │   ├── MainCard.js : 현재 등록된 course 정보를 백엔드에서 받아서 카드로 나타내는 컴포넌트 [호출: CourseCard]
    │   └── CourseCard.js : 상위 MainCard 컴포넌트에서 전달받은 props를 나타내는 레이아웃 컴포넌트
    │
    ├── config/
    │   └── next.config.js
    │
    ├── lib/
    │   └── ga/
    │   │   └── index.js
    │   └── context.js
    │
    ├── pages/
    │   ├── courses/
    │   │   └── [id].js : 강의 페이지
    │   ├── _app.js : Next.js에서 전체 컴포넌트 구조를 결정, 공통 컴포넌트(navbar, footer)가 선언되도록 customizing 됨.
    │   ├── _document.js : Next.js에서 전체 html 문서의 구조를 결정, lang 속성과 meta tag가 customizing 됨.
    │   ├── about.js : 단체 소개 페이지
    │   ├── index.js : 메인 페이지
    │   ├── question.js : Q&A 페이지
    │   └── setting.js : 쿠키, 구글 애널리틱스 정보 수집 정책 페이지
    │
    ├── public/
    │   ├── favicon.ico : 네비게이션바 이미지
    │   └── logo_about.png : about 페이지 로고 이미지
    │
    └── styles/
        └── Home.module.css

```
-->
