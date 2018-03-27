
#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface Tool_FMDBGetDatabase : NSObject
@property(nonatomic,strong,readonly)FMDatabaseQueue *dbQueue;
+ (instancetype)shareTool_FMDBGetDatabase;
//创建文件夹，拼接数据库路径（此时数据库还没创建）
+ (NSString *)dbPath;
@end
