const main_url = 'http://192.168.1.13:8000';

// AUTH URLS

const auth = '${main_url}/api/auth';
const login_url = '${auth}/login/';
const register_url = '${auth}/register/';
const logout_url = '${auth}/logout/';
const password_change_url = '${auth}/password/change/';
const get_user_url = '${auth}/get_user/';

// CVRESUME URLS

const cv_resume = '${main_url}/api/cv_resume';
const get_cv_info_url = '${cv_resume}/';
const create_cv = '${cv_resume}/create';
const download_cv = '${cv_resume}/download/';
const cv_resumes = '${cv_resume}/cvresumes';

// INVITATION CARD URLS

const invitation_card = '${main_url}/api/invitation_card';
const get_invitation_card_info_url = '${invitation_card}/';
const create_invitation_card = '${invitation_card}/create';
const download_invitation = '${invitation_card}/download';
const get_invitation_cards = '${invitation_card}/invitationcards';

// COVER LETTERS

const cover_letter = '${main_url}/api/cover_letter';
const get_cover_letters = '${cover_letter}/cover-letters';
const download_cover_letter = '${cover_letter}/download';

