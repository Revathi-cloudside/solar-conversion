from django.contrib import admin
from dgusers.models import UserRole, AlertsCategory, UserRolePlantsAlertsPreferences

# Register your models here.

class AlertsCategoryInline(admin.TabularInline):
    model = AlertsCategory

class UserRolePlantsAlertsPreferencesInline(admin.TabularInline):
    model = UserRolePlantsAlertsPreferences

@admin.register(UserRole)
class UserRoleAdmin(admin.ModelAdmin):
    model = UserRole
    inlines = [AlertsCategoryInline, UserRolePlantsAlertsPreferencesInline]

