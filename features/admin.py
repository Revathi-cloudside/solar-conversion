from django.contrib import admin
from .models import Feature, FeatureCategory, DGClientSubscription, RoleAccess, \
    DataglenClient, Dashboard, SubscriptionPlan

# Register subscription.
@admin.register(SubscriptionPlan)
class DataGlenSubscriptionAdmin(admin.ModelAdmin):
    model = SubscriptionPlan



class FeatureCategoryInline(admin.TabularInline):
    model = Feature


@admin.register(FeatureCategory)
class DGFeatureCategoryAdmin(admin.ModelAdmin):
    model = FeatureCategory
    inlines = [FeatureCategoryInline]


admin.site.register(Feature)

admin.site.register(DGClientSubscription)

admin.site.register(RoleAccess)