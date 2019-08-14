Rails.application.routes.draw do
    #テスト
    #root  to: 'users#check_test'
    #post 'users/check_user' => "users#check_user"
    get 'users/check_test'
    post 'users/check_test'
    post 'users/check_user'
    #root 'users#check_test'
    resources :users, only: [:check_user]
    get  'users/eva_detail/:id' => "users#eva_detail"
    get  'users/menu' => "users#menu"
  post 'support/payment_cc' => "support#payment_cc"
  get 'support/pay_test' => "support#pay_test"

   post 'support/password_reset' => "support#password_reset"
  get  'support/pass_setting' => "support#pass_setting"
  post 'support/pass_set' => "support#pass_set"
  post 'support/payment'

  get 'support/transfer' => "support#transfer"
  get 'users/token/:uuid', :to => 'users#token'
  get 'support/pass_setting/:uuid', :to => 'support#pass_setting'

  get 'support/revenue', :to => 'support#revenue'
  post 'support/bank_delete'
  post 'support/bank_create' => "support#bank_create"
  get 'support/bank' => "support#bank"
  get 'users/show_follow/:id' => "users#show_follow"
  post 'dog/choice_user/:id' => "dog#choice_user"
  get 'dog/management/:id' => "dog#management"
  get 'users/news/:id' => "users#news"
  get 'dog/entry/:id' => "dog#entry"
  post 'users/messeage_create/:id' => "users#message_create"
  get 'users/seen/direct_message/:id' => "users#direct_message"
  get 'users/talk/:id' => "users#talk"
  get 'users/destroy_re/:id' => "users#destroy_re"
  get 'users/rely/:id' => "users#rely"
  post 'users/edit_re/:id' => "users#edit_re"
  get 'users/update_re/:id' => "users#update_re"
  post 'users/create_re' => "users#create_re"
  get 'users/check/:id' => "users#check"
  get 'users/writing' => "users#writing"
  get 'users/seen/:id' => "users#seen"
  get 'users/seen/seen_evaluation/:id' => "users#seen_evaluation"
  get 'users/seen/seen_evaluation_dog/:id' => "users#seen_evaluation_dog"
  get 'users/new'
  get 'support/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  get "beginner's_guide" => "home#guide"
  get "support/index" => "support#index"
  get "support/registration_question" => "support#registration_question"
  get "support/deposit" => "support#deposit"
  get "support/entrusted" => "support#entrusted"
  get "support/ban" => "support#ban"
  get "support/system" => "support#system"
  get "support/other" => "support#other"
  get "support/registration" => "support#registration"
  get "support/registration1" => "support#registration1"
  get "support/registration2" => "support#registration2"
  get "support/registration3" => "support#registration3"
  get "support/registration4" => "support#registration4"
  get "support/registration5" => "support#registration5"
  get "support/registration6" => "support#registration6"
  get "support/registration7" => "support#registration7"
  get "support/registration8" => "support#registration8"
  get "support/registration9" => "support#registration9"
  get "support/registration10" => "support#registration10"
  get "support/registration11" => "support#registration11"
  get "support/registration12" => "support#registration12"
  get "support/registration13" => "support#registration13"
  get "support/registration14" => "support#registration14"
  get "support/registration15" => "support#registration15"
  get "support/registration16" => "support#registration16"
  get "support/registration17" => "support#registration17"
  get "support/registration18" => "support#registration18"
  get "support/registration19" => "support#registration19"
  get "support/registration20" => "support#registration20"
  get "support/registration21" => "support#registration21"
  get "support/registration22" => "support#registration22"
  get "support/registration23" => "support#registration23"
  get "support/registration24" => "support#registration24"
  get "support/registration25" => "support#registration25"
  get "support/registration26" => "support#registration26"
  get "support/registration27" => "support#registration27"
  get "support/registration27_1" => "support#registration27_1"
  get "support/registration28" => "support#registration28"
  get "support/registration29" => "support#registration29"
  get "support/registration30" => "support#registration30"
  get "support/registration31" => "support#registration31"
  get "support/registration32" => "support#registration32"
  get "support/registration33" => "support#registration33"
  get "support/registration34" => "support#registration34"
  get "support/registration35" => "support#registration35"
  get "support/registration36" => "support#registration36"
  get "support/registration37" => "support#registration37"
  get "support/registration38" => "support#registration38"
  get "support/registration39" => "support#registration39"
  get "support/registration39_1" => "support#registration39_1"
  get "support/registration40" => "support#registration40"
  get "support/registration41" => "support#registration41"
  get "support/registration42" => "support#registration42"
  get "support/registration43" => "support#registration43"
  get "support/registration44" => "support#registration44"
  get "support/registration45" => "support#registration45"
  get "support/registration46" => "support#registration46"
  get "support/registration47" => "support#registration47"
  get "support/registration48" => "support#registration48"
  get "support/registration49" => "support#registration49"
  get "support/registration50" => "support#registration50"
  get "support/registration51" => "support#registration51"
  get "support/registration52" => "support#registration52"
  get "support/registration53" => "support#registration53"
  get "support/registration54" => "support#registration54"
  get "support/registration55" => "support#registration55"
  get "support/registration56" => "support#registration56"
  get "support/registration57" => "support#registration57"
  get "support/registration58" => "support#registration58"
  get "support/registration59" => "support#registration59"
  get "support/registration60" => "support#registration60"
  get "support/registration61" => "support#registration61"
  get "support/registration62" => "support#registration62"
  get "support/registration63" => "support#registration63"
  get "support/registration64" => "support#registration64"
  get "support/registration65" => "support#registration65"
  get "support/registration66" => "support#registration66"
  get "support/registration67" => "support#registration67"
  get "support/registration68" => "support#registration68"
  get "support/registration69" => "support#registration69"
  get "support/registration70" => "support#registration70"
  get "support/registration71" => "support#registration71"
  get "support/registration72" => "support#registration72"
  get "support/registration73" => "support#registration73"
  get "support/registration74" => "support#registration74"
  get "support/registration75" => "support#registration75"
  get "support/registration76" => "support#registration76"
  get "support/registration77" => "support#registration77"
  get "support/registration78" => "support#registration78"
  get "support/registration79" => "support#registration79"
  get "support/registration80" => "support#registration80"
  get "support/registration81" => "support#registration81"
  get "support/registration82" => "support#registration82"
  get "support/registration83" => "support#registration83"
  get "support/registration84" => "support#registration84"
  get "support/registration85" => "support#registration85"
  get "support/registration86" => "support#registration86"
  get "support/registration87" => "support#registration87"
  get "support/registration88" => "support#registration88"
  get "support/deposit_dog" => "support#deposit_dog"
  get "support/entrusted_dog" => "support#entrusted_dog"
  get "support/flow" => "support#flow"
  get "support/rule" => "support#rule"
  get "support/about_evaluation" => "support#about_evaluation"
  get "support/user_check" => "support#user_check"
  get "support/about_fee" => "support#about_fee"
  get "support/mouth" => "support#mouth"
  get "support/user_introduction" => "support#user_introduction"
  get "support/company_profile" => "support#company_profile"
  get "support/recruitment" => "support#recruitment"
  get "support/inquiry" => "support#inquiry"
  post "support/question" => "support#question"
  get "support/configuration/:id" => "support#configuration"
  get "support/phone" => "support#phone"
  get "support/email" => "support#email"
  get "support/cc" => "support#cc"
  get "support/user_information" => "support#user_information"
  get "support/user_identification" => "support#user_identification"
  post "support/detail_create" => "support#detail_create"
  post "support/user_edit" => "support#user_edit"
  get "support/password" => "support#password"
  post "support/user_edit_pass" => "support#user_edit_pass"
  post "support/user_edit_card" => "support#user_edit_card"
  post "support/uproad" => "support#uproad"

# 利用規約関係---------------------------------
  get 'notation/safe'
  get 'notation/guide_payment' => "notation#guide_payment"
  get 'notation/terms' => "notation#terms"
  get 'notation/privacy' => "notation#privacy"
  get 'notation/commerce' => "notation#commerce"
  get 'notation/settlement' => "notation#settlement"
  get 'notation/member_store' => "notation#member_store"

  # User関係---------------------------------

    get 'users/index' => "users#index"
    get 'users/impression/:id' => "users#impression"
    get 'users/storage/:id' => "users#storage"
    get 'users/edit/:id' => "users#edit"
    post 'users/update/:id' => "users#update"
    post 'users/introduction/:id' => "users#introduction"
    post 'users/new' => "users#new"
    post 'users/temporary' => "users#temporary"
    get 'users/login' => "users#login"
    post 'users/authentication' => "users#authentication"
    get 'users/mydog/:id' => "users#mydog"
    get 'users/evaluation/:id' => "users#evaluation"
    get 'users/history/:id' => "users#history"
    get 'users/:id' => "users#show"
    post 'users/judge/:id' => "users#judge"
    post 'users/judge_storage/:id' => "users#judge_storage"
    post 'users/follow/:id' => "users#follow"
    post 'users/un_follow/:id' => "users#un_follow"
    get 'user/request/:id' => "user#request"
    post 'user/re_create/:id' => "user#re_create"



# Post関係-----------------------------



# Dog関係-----------------------------

  get 'dog/new/:id' => "dog#new"
  get 'users/dog_edit/:id' => "users#dog_edit"
  post 'users/dogUpdate/:id' => "users#dogUpdate"
  post 'dog/create' => "dog#create"
  post 'dog/create_my' => "dog#create_my"
  post 'dog/introduction/:id' => "dog#introduction"
  post 'dog/search' => "dog#search"
  get 'dog/details/:id' => "dog#details"
  get 'dog/details/:id' => "dog#details"
  get 'dog/entry_delete/:id' => "dog#entry_delete"
  get 'dog/entrusted/:id' => "dog#entrusted"
  get 'support/re_password' => "support#re_password"



#cropperテスト------------

  get 'users/cropper/test/:id' => "users#cropper"
  get 'users/cropper/test2/:id' => "users#testCropper"

# ログアウト-----------------------------
post 'logout' => "home#logout"







end
