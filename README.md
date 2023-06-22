# 🐢 RE:SLOW
### 환경보호와 현명한 가치소비를 지원하는 리폼 종합 플랫폼

![로고](/images/main.png)

</br>  

## 🐢 플레이스토어
<img src="/images/QR%EC%BD%94%EB%93%9C.png"  width="300" height="300"/>


## ✔ 프로젝트 진행 기간
2022.04.10(월) ~ 2022.05.19(금)


<br/>


## ✔ 기획의도
- 최근에는 개인의 취향과 개성을 중시하는 추세입니다.  
- 통계에 따르면 개인 취향을 중시하는 트렌드를 느낀다고 응답한 사람이 82프로이며, 이에 따라 개인 취향을 겨냥한 서비스와 상품을 이용한다고 응답한 사람이 78프로에 이릅니다.  
- 또 다른 소비자 조사에 따르면, 해가 지날수록 환경에 관심이 많다고 응답한 소비자가 증가하고 있는 추세입니다.  
- 이러한 트렌드에 따라, 개성도 살리고 환경도 지키는 방법으로 리폼을 생각하게 됐습니다. 리폼을 통해 나만의 아이템도 만들고 지구도 지켜보세요!


<br/>

## ✔ 개요
*- 리폼을 통해 개성과 환경을 지키며, 노하우를 공유하고 전자상거래를 활성화한다. -*  

RE:SLOW는 제품의 리폼(reform)을 통해 소비 생활을 돕는다는 의미입니다.
제품의 리폼 노하우를 공유하여 사용자들끼리의 소통을 통해 리폼 시장 확장을 도왔습니다.
또한 리폼한 제품을 판매함으로써, 수익화를 통한 활동을 장려하도록 했습니다.



<br/>

## ✔ 주요 기능
---


- ### 리폼 플리마켓 - 커머스
    - 본인이 만든 소소한 리폼 작품을 판매하는 공간입니다.
    - 리폼 활동 수익화를 통한 활동 지속성을 증가시킵니다.
    - 독창성 있는 커스텀 제품을 구입할 수 있는 기회를 제공합니다.
    <br/>
- ### 리폼 노하우 - 커뮤니티
    - 본인의 리폼 레시피를 공유하고 소통하는 공간입니다.
    - 커뮤니티 활동을 통한 리폼 시장을 확장합니다.
    - 어플리케이션을 이용하여 사용자 편리성을 도모합니다.
    <br/>
- ### 정산 시스템
    - 정산 시스템을 통해 구매자는 신뢰를 가지고 물건을 구매할 수 있습니다.
    - 정산은 매일 자정에, 배송은 매 90분 마다 상태 처리가 되도록 자동화했습니다.
    <br/>
- ### 채팅
    - 1:1 채팅을 통한 유저간 자유로운 소통을 돕습니다.
    <br/>
- ### 알림
    - 채팅, 주문서 도착, 댓글이 달렸을 시 푸시 알림을 통해 사용자에게 알립니다.
    <br/>
- ### 게시글 추천
    - 사용자가 좋아요를 많이 누른 카테고리와 최근에 구입한 물품을 기준으로 개인화된 상품/글 추천을 제공합니다.
    - 사용자가 지닌 재료를 기반으로 사용자가 좋아요를 많이 누른 카테고리를 기준으로 리폼 노하우 글을 추천합니다.
    <br/>

<br/>

## ✔ 주요 기술
---

**Backend - Spring**
- IntelliJ IDE
- OpenJDK 11
- Springboot 2.7.11
- Spring Data JPA
- Spring Security 5.7.6
- Spring Batch 5.0.2
- QueryDSL 1.0.10
- Redis 7.0.8
- MySQL 8.0.32
- MongoDB 6.0.5
- firebase 9.1.1

**Frontend**
- Visual Studio Code IDE
- android studio 2022.2.1
- flutter sdk 3.10.1
- gradle 7.3.0
- dart 3.0.0

**CI/CD**
- AWS EC2
    - Ubuntu 20.04 LTS
    - Docker 23.0.4
- Jenkins

<br/>
<br/>

## ✔ 프로젝트 파일 기본구조
---
### Backend
```
reslow
  ├── domain
  │   └── chatting
  │          ├── config
  │          ├── controller
  │          ├── dto
  │          ├── entity
  │          ├── repository
  │          └──  service
  │   ├── coupon
  │   ├── knowhow
  │   ├── manager
  │   ├── member
  │   ├── notice
  │   ├── order
  │   ├── product
  │   └──  settlement
  │
  ├── global
  │     ├── auth
  │     │     ├── config
  │     │     ├── handler
  │     │     └── jwt
  │     ├── common
  │     │     ├── dto
  │     │     ├── entity
  │     │     └── FCM
  │     │
  │     ├── config
  │     └── exception
  │
  └── infra
        ├── banking
        ├── delivery
        └── storage
```

<br/>

### Frontend
```
frontend
  ├── .vscode
  ├── android
  ├── assets
  ├── functions
  ├── ios
  ├── test
  ├── .firebaserc
  ├── .metadata
  ├── README.md
  ├── analysis_options.yaml
  ├── database.rules.json
  ├── firebase.json
  ├── flutter_launcher_icons.yaml
  ├── pubspec.lock
  ├── pubspec.yaml
  ├── lib
  │
  ├── widgets
  │     ├── common
  │     ├── knowhow
  │     └── market
  │
  ├── pages
  │     ├── auth
  │     ├── chat
  │     ├── home
  │     ├── knowhow
  │     ├── market
  │     └── profile
  │
  ├── models
  ├── providers
  ├── services
  └── utils

```


<br/>
<br/>

### 아키텍처
---
![아키텍처](/images/%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98.png)

<br/>
<br/>

### ERD
---
![ERD](/images/ERD.PNG)

<br/>
<br/>

## ✔ 협업 툴
---
- GitLab
- Notion
- JIRA
- MatterMost
- Webex

<br/>
<br/>

## ✔ 협업 환경
---
- Gitlab
  - Git Flow 브랜치 전략 사용
  - 팀원과의 소통을 위해 설정한 Git Convention을 따름
- JIRA
  - 매주 월요일 목표를 설정하여 Sprint 진행
  - 업무의 할당량을 정하여 Story Point를 설정함
- 회의
  - 매일아침 20분씩 스크럼을 통해 진행사항 공유
  - 긴급 안건이 있는 경우 별도의 회의를 진행함
- Notion
  - 회의가 있을때마다 회의록을 기록하여 보관
  - 전날 진행한 사항과 진행할 사항 등에 관한 스크럼 사항 기록
  - 기술확보 시, 다른 팀원들도 추후 따라할 수 있도록 보기 쉽게 작업 순서대로 정리
  - 컨벤션 정리
  - 기능명세서, API 명세서 등 모두가 공유해야 하는 문서 관리

<br/>
<br/>
  
## ✔ 팀원 역할 분배
---
![팀원 역할 분배](/images/team_introduce.PNG)

<br/>
<br/>

## ✔ 프로젝트 산출물
---
- [기능명세서](/docs/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%20%EB%AA%85%EC%84%B8%EC%84%9C.md)
- [UI/UX](/docs/UIUX.md)
- [코드 컨벤션](/docs/%EC%BD%94%EB%93%9C%20%EC%BB%A8%EB%B2%A4%EC%85%98.md)
- [깃 컨벤션](/docs/GIT%20%EC%BB%A8%EB%B2%A4%EC%85%98.md)
- [지라 컨벤션](/docs/JIRA%20%EC%BB%A8%EB%B2%A4%EC%85%98.md)
- [깃 브랜치전략](/docs/GIT%20%EB%B8%8C%EB%9E%9C%EC%B9%98.md)
- [API](/docs/API%EB%AA%85%EC%84%B8%EC%84%9C.md)
- [ERD](/docs/ERD.md)
- [시스템 구조도](/docs/%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98.md)

<br/>
<br/>

## ✔ 프로젝트 결과물
-   [포팅메뉴얼](/exec/%ED%8F%AC%ED%8C%85%20%EB%A9%94%EB%89%B4%EC%96%BC.md)
-   [중간발표자료](/ppt/%EC%A4%91%EA%B0%84%EB%B0%9C%ED%91%9CPPT.pdf)
-   [최종발표자료](/ppt/%EC%B5%9C%EC%A2%85%EB%B0%9C%ED%91%9CPPT.pdf)

<br/>
<br/>

## 🐢 ALCOL 서비스 화면
### 메인 화면

- 회원가입, 로그인 기능을 활용할 수 있습니다.
- 사용자 맞춤형 플리마켓 상품을 추천받을 수 있습니다.
- 현재 가장 인기있는 상품과 노하우 글을 추천받을 수 있습니다.

|     홈화면     |
| ------------ |
| <img src="/images/service/home.gif"  width="300" height="600"/> |

### 쿠폰발급

- 쿠폰을 발급받아 플리마켓에서 사용할 수 있습니다.

|     쿠폰발급     |
| ------------ |
| <img src="/images/service/coupon.gif"  width="300" height="600"/> |

### 노하우

- 리폼 꿀팁 노하우를 공유할 수 있습니다.
- 좋아요를 누르고 댓글을 달아 소통할 수 있습니다.
- 댓글을 달면 작성자에게 알림 보내 알릴 수 있습니다.

|     노하우 홈     |      글쓰기       |   내가 쓴 노하우  |
| ------------ | ------------- | ------------- |
| <img src="/images/service/knowhow-category.gif"  width="300" height="600"/> | <img src="/images/service/knowhowpage.gif"  width="300" height="600"/>  | <img src="/images/service/mypage-knowhow.gif"  width="300" height="600"/>  |



### 플리마켓

- 플리마켓을 통해 리폼한 물품을 사고 팔 수 있습니다.

|     플리마켓 홈     |      글쓰기       |
| ------------ | ------------- |
| <img src="/images/service/market-category.gif"  width="300" height="600"/> | <img src="/images/service/market.gif"  width="300" height="600"/>  |

- 궁금한 사항은 채팅을 통해 물어볼 수 있습니다.

|     채팅걸기     |      채팅하기       |      알림       |
| ------------ | ------------- | ------------- |
| <img src="/images/service/market-chat.gif"  width="300" height="600"/> | <img src="/images/service/chatting.gif"  width="300" height="600"/>  | <img src="/images/service/notice.jpg"  width="300" height="600"/> |


### 판매내역
- 판매자는 들어온 주문을 확인하고 수락/거절할 수 있습니다.
- 보낸 물품의 운송장 번호를 입력하여 택배를 추적할 수 있습니다.
- 배송을 완료한 후 구매자가 구매확정 클릭 시 정산 리스트에 추가됩니다.

|     판매내역    |
| ------------ |
| <img src="/images/service/mypage-salespage.gif"  width="300" height="600"/> |

### 정산
- 구매확정된 +1 영업일 오전 5시에 자동으로 정산 기능이 활성화됩니다.

|     정산페이지    |
| ------------ |
| <img src="/images/service/settlement.gif"  width="300" height="600"/> |

### 관리자 사이트

- 관리자는 웹사이트로 로그인하여 쿠폰을 등록하고 쿠폰 목록을 확인할 수 있습니다.

|     관리자사이트     |
| ------------ |
| ![홈](/images/service/managepage.gif)|
