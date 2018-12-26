class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :message => "用户名不能为空!";
  validates_length_of :username, :maximum => 20,  :message => "用户名长度不得长于20位字母或数字!"
  validates_uniqueness_of :username,:case_sensitive => false, :message => "该用户名已存在!"
  validates_presence_of :password, :message =>"密码不能为空!"
  validates_length_of :password, :minimum => 6, :message=>"密码长度不得短于6位字母或数字! "
  validates_presence_of :password_confirmation,  :message =>"请再输入一次密码!", :allow_blank => true
  validates_confirmation_of :password,  :message => "两次密码不一致!"
  validates_format_of(:email,:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,:message =>"邮箱地址格式错误！")
end
