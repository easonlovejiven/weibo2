# language: zh-CN
# @p2p
功能: 通过微博登录页面，注册一个新用户

  场景大纲: 在微博系统中注册一个新用户
    假如 访问[注册页面]
    而且 输入email为: <email>
    而且 输入password为: <password>
    而且 输入password_confirmation为: <password_confirmation>
    
    当 点击[注册按钮]
    那么 我应该看到结果 <result>

  例子: 
     |case_id  | email                 |  password  | password_confirmation | 说明       | result                       |
     |   1     | changbao@caishuo.com  |  12345678  | 12345678              |  ok       |  注册成功                      |
     |   2     | test@caishuo.com      |  12345678  | 123456                |  faild    |  注册失败，确认密码与密码不一致   |
     
