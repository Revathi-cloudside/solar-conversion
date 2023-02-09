# Generated by Django 4.1.5 on 2023-02-09 04:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('django_comments', '0004_add_object_pk_is_removed_index'),
    ]

    operations = [
        migrations.CreateModel(
            name='DgComment',
            fields=[
                ('comment_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='django_comments.comment')),
                ('image_base_64', models.TextField(blank=True, null=True)),
            ],
            options={
                'verbose_name': 'dg comment',
                'verbose_name_plural': 'dg comments',
            },
            bases=('django_comments.comment',),
        ),
    ]