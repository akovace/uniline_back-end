from rest_framework import serializers

from uniappline.models import Unit, Property
from uniappline.serializers import UnitSerializer


class TestSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    unit = UnitSerializer(required=True)
    from_date = serializers.DateField()
    to_date = serializers.DateField()
    min_nights = serializers.IntegerField()
    nr_persons = serializers.IntegerField()
    checkin_days = serializers.CharField(max_length=7)
    price = serializers.DecimalField(max_digits=8, decimal_places=2)