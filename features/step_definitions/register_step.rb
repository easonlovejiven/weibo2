当(/^访问\[注册页面\]$/) do
  visit("/users/sign_up")
end

假如(/^输入email为: (.*)$/) do |arg1|
  fill_in("user_email", with: arg1)
end

假如(/^输入password为: (.*)$/) do |arg1|
  fill_in("user_password", with: arg1)
end

假如(/^输入password_confirmation为: (.*)$/) do |arg1|
  fill_in("user_password_confirmation", with: arg1)
end

当(/^点击\[注册按钮\]$/) do
  click_button("Sign up")
end

那么(/^我应该看到结果 注册失败，确认密码与密码不一致$/) do
  page.should have_content("Password confirmation doesn't match Password")
end

那么(/^我应该看到结果 注册成功$/) do
  page.should have_content("successfully")
end