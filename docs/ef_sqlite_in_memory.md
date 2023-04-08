# 엔티티 프레임워크 (C# Entity Framework Sqlite in memory)

## 상황

sqlite :memory: 환경에서 모델 저장시 테이블 찾지 못 하는 예외 발생

```csharp

    public class UserDbContext : DbContext
    {
        public DbSet<Model> ModelSet { get; set;}

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlite(@"Data Source=:memory:");
        }
    }

    public class ExampleApp
    {
        public void Run()
        {
            using (var userDbCtx = new UserDbContext)
            {
                var newModel = new Model();
                userDbCtx.Add(newModel);
                userDbCtx.SaveChanges(); // EXCEPTION(no such table: Model)
            }
        }
    }
```

# 해법

<https://github.com/dotnet/efcore/issues/5086>

sqlite :memory: 환경에서 SqliteConnection 를 프레임워크에 전달한 다음 DbContext.Database.EnsureCreated() 를 사용해 테이블을 생성합니다.

```csharp
    public class UserDbContext : DbContext
    {
        public DbSet<Model> ModelSet { get; set;}

        // FIX
        public UserDbContext()
        {
            _conn = new SqliteConnection(@"Data Source=:memory:");
            _conn.Open();
        }
        // FIX_END

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlite(_conn); // FIX
        }

        private SqliteConnection _conn;
    }

    public class ExampleApp
    {
        public void Run()
        {
            using (var userDbCtx = new UserDbContext)
            {
                userDbCtx.Database.EnsureCreated(); // FIX

                var newModel = new Model();
                userDbCtx.Add(newModel);
                userDbCtx.SaveChanges();
            }
        }
    }
```