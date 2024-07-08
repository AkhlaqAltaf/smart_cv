var main_url = 'http://192.168.0.103:8000';

// AUTH URLS

var auth = '${main_url}/api/auth';
var login_url = '${auth}/login/';
var register_url = '${auth}/register/';
var logout_url = '${auth}/logout/';
var password_change_url = '${auth}/password/change/';
var get_user_url = '${auth}/get_user/';

// CVRESUME URLS

var cv_resume = '${main_url}/api/cv_resume';
var get_cv_info_url = '${cv_resume}/';
var create_cv = '${cv_resume}/';
var download_cv = '${cv_resume}/download/';
var cv_resumes = '${cv_resume}/cvresumes';
var upload_image = '${cv_resume}/upload_image';

// INVITATION CARD URLS

var invitation_card = '${main_url}/api/invitation_card';
var get_invitation_card_info_url = '${invitation_card}/';
var create_invitation_card = '${invitation_card}/';
var download_invitation = '${invitation_card}/download';
var get_invitation_cards = '${invitation_card}/invitationcards';

// COVER LETTERS

var cover_letter = '${main_url}/api/cover_letter';
var get_cover_letters = '${cover_letter}/cover-letters';
var download_cover_letter = '${cover_letter}/download';
var create_cover_letter = '${cover_letter}/';
var delete_cover_letter = '${cover_letter}';
