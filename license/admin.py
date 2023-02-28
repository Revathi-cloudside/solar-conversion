from django.contrib import admin
from license.models import License, Installation

# Register your models here.
class InstallationInline(admin.TabularInline):
    model = Installation

@admin.register(License)
class LicenseAdmin(admin.ModelAdmin):
    model = License
    # inlines = [InstallationInline]
    search_fields = ['license_key', 'installation_key']

admin.site.register(Installation)

