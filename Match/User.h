

#import "Tool_FMDBModel.h"

@interface User : Tool_FMDBModel

//用户信息

/**ID */
@property (nonatomic, copy)     NSString                    *user_id;
/** 昵称 */
@property (nonatomic, copy)     NSString                    *user_name;
/** 电话号码 */
@property (nonatomic, copy)     NSString                    *user_tel;
/**密码*/
@property (nonatomic, copy)     NSString                    *user_pwd;
/** 姓名 */
@property (nonatomic, copy)     NSString                    *user_truename;
/**证件号 */
@property (nonatomic, copy)     NSString                    *user_card;
/** 账号 */
@property (nonatomic, copy)     NSString                    *user_account;
/**地址*/
@property (nonatomic, copy)     NSString                    *user_address;
/** 性别*/
@property (nonatomic, copy)  NSString                      *user_sex;
/** 年龄*/
@property (nonatomic, copy)  NSString                      *user_age;


//图书借阅信息

/** 书ID*/
@property (nonatomic, copy)  NSString                      *book_borrow_id;
/** 发布时间*/
@property (nonatomic, copy)  NSString                      *book_FBtime;
/** 发布人电话*/
@property (nonatomic, copy)  NSString                      *book_FBtel;
/** 借阅人电话*/
@property (nonatomic, copy)  NSString                      *book_JYtel;
/** 借阅时间*/
@property (nonatomic, copy)  NSString                      *book_JYtime;
/** 还书时间*/
@property (nonatomic, copy)  NSString                      *book_return_time;

//物品交易

/** 交易ID*/
@property (nonatomic, copy)  NSString                      *goods_transact_id;
/** 卖家订单确认时间*/
@property (nonatomic, copy)  NSString                      *goods_time;
/** 发布人电话*/
@property (nonatomic, copy)  NSString                      *goods_Ftel;
/** 收货人电话*/
@property (nonatomic, copy)  NSString                      *goods_Stel;
/** 收货时间*/
@property (nonatomic, copy)  NSString                      *goods_Stime;



@end
