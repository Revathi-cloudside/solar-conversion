# Generated by Django 4.1.5 on 2023-02-09 04:06

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('license', '0004_alter_installation_install_ts'),
    ]

    operations = [
        migrations.AlterField(
            model_name='installation',
            name='install_ts',
            field=models.DateTimeField(default=datetime.datetime(2023, 2, 9, 4, 6, 1, 960062)),
        ),
    ]
