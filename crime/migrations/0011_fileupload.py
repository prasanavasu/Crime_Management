# Generated by Django 3.0.3 on 2020-02-27 07:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('crime', '0010_remove_addcriminalls_email'),
    ]

    operations = [
        migrations.CreateModel(
            name='fileupload',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bnname', models.CharField(max_length=100)),
                ('crimename', models.CharField(max_length=100)),
                ('crimearea', models.CharField(max_length=1000)),
                ('value', models.CharField(max_length=10)),
                ('files', models.FileField(upload_to='file')),
            ],
        ),
    ]
