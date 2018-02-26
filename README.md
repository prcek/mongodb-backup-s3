# mongodb-backup-s3

This image runs mongodump to backup data using cronjob to an s3 bucket

## Usage:

```
docker run -d \
  --env AWS_ACCESS_KEY_ID=awsaccesskeyid \
  --env AWS_SECRET_ACCESS_KEY=awssecretaccesskey \
  --env BUCKET=s3bucket \
  --env MONGODB_URI=mongodb://db1.example.net:27017,db2.example.net:2500/?replicaSet=test \
  prcek/mongodb-backup-s3
```


Or use `INIT_BACKUP` with `DISABLE_CRON` for one snapshot.
```
docker run -d \
  --env AWS_ACCESS_KEY_ID=awsaccesskeyid \
  --env AWS_SECRET_ACCESS_KEY=awssecretaccesskey \
  --env BUCKET=s3bucket \
  --env MONGODB_URI=mongodb://db1.example.net:27017,db2.example.net:2500/?replicaSet=test \
  --env INIT_BACKUP=true \
  --env DISABLE_CRON=true \
  prcek/mongodb-backup-s3
```

## Parameters

`AWS_ACCESS_KEY_ID` - your aws access key id (for your s3 bucket)

`AWS_SECRET_ACCESS_KEY`: - your aws secret access key (for your s3 bucket)

`BUCKET`: - your s3 bucket

`BACKUP_FOLDER`: - name of folder or path to put backups (eg `myapp/db_backups/`). defaults to root of bucket.

`MONGODB_URI` - the uri of your mongodb database

`CRON_TIME` - the interval of cron job to run mongodump. `0 3 * * *` by default, which is every day at 03:00hrs.

`TZ` - timezone. default: `US/Eastern`

`CRON_TZ` - cron timezone. default: `US/Eastern`

`INIT_BACKUP` - if set, create a backup when the container launched

`DISABLE_CRON` - if set, it will skip setting up automated backups. good for when you want to use this container to seed a dev environment.

