<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<link rel="stylesheet"    href="assets/css/style.css" >
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
 
 function showPostCode() {
          new daum.Postcode({
            oncomplete : function(data) {
            	console.log(data)
              $('input[name=postalCode]').val(data.zonecode);
              $('input[name=address1]').val(data.sido);
              $('input[name=address2]').val(data.sigungu);
              $('input[name=address3]').val(data.roadAddress);
              $('input[name=address4]').attr('readonly', false);
              $('input[name=address4]').focus();
            }
          }).open();
      }
  </script>
</head>
<body>
  <div class="contents-wrap">
    <div class="con center">
      <ul class="join-title">
        <li><img src="assets/images/img-embelm-128@2x.png"></li>
        <li>
            <h6>회원가입</h6>
            <p>티켓예매, 포인트 등 다양한 혜택을 누리세요.</p>
        </li>
    </ul>
      <div class="tab-container">
        <div class="cont active" id="stage2">
          <form id="form">
            <ul class="join-wrap">
              <li>아이디</li>
              <li>
                <input class="id-input" id="username" name="username" type="text" onchange="resetCheckId();"
                  placeholder="아이디를 입력해 주세요." />
                <button type="button" onclick="checkId();">중복확인</button>
              </li>
              <li>비밀번호 <label>(영문 대/소문자, 특수문자를 포함 10-20자로 입력해주세요.)</label> <br><label>사용가능 특수문자 : !@#$%^&* </label></li>
              <li><input name="password" type="password" placeholder="비밀번호를 입력해 주세요." /></li>
              <li>비밀번호 확인</li>
              <li><input name="password2" type="password" placeholder="비밀번호를 다시 한번 입력해 주세요." /></li>
              <li>이름</li>
              <li><input id="name" name="name" type="text" placeholder="이름" /></li>
              <li>생년월일</li>
              <li id="birthChk"><input id="birth" name="birth" type="text" placeholder="생일" /></li>
              <li>성별</li>
              <li>
                <!-- <fieldset> -->
                  <input type="radio" id="male" name="gender" value="MALE" >
                  <label for="male">남자</label>
                  <input type="radio" id="female" name="gender" value="FEMALE" >
                  <label for="female">여자</label>
                <!-- </fieldset> -->
              </li>
              <li>전화번호</li>
              <li><input id="phone" name="phone" type="text"  placeholder="연락처" /></li>
              <li>이메일</li>
              <li><input id="email" name="email" type="text" placeholder="이메일을 입력해 주세요." /></li>
              <li>주소<label> (선택)</label></li>
              <li>
                <input class="post-input" id="postalCode" name="postalCode" type="text" placeholder="우편번호" readonly />
                <button type="button" onclick="showPostCode()">검색</button>
              </li>
              <li><input id="address1" name="address1" type="hidden" placeholder="시/도" />
                <input id="address2" name="address2" type="hidden" placeholder="구" />
                <input id="address3" name="address3" type="text" placeholder="주소" readonly />
              </li>
              <li><input id="address4" name="address4" type="text" placeholder="주소 검색 후 상세주소를 입력해 주세요."  /></li>
              
            </ul>
            <div class="hidden">
              <input id="adultYn" name="adultYn" type="hidden" />
              <input id="channel" name="channel" type="hidden" />
            </div>
            <button type="button" class="join-btn" onclick="join()">회원가입</button>
          </form>
        </div>
      </div>
     </div> 
  </div>
  <script src="assets/js/script.js"></script>
</body>
</html>