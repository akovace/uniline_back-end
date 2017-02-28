from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from rest_framework.response import Response

from uniappline.models import Unit, Base_price
from uniappline.serializers import UnitSerializer

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)


@csrf_exempt
def unit_list(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        units = Unit.objects.all()
        serializer = UnitSerializer(units, many=True)
        return JSONResponse(serializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = UnitSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data, status=201)
        return JSONResponse(serializer.errors, status=400)


@api_view()
def hello_world(request):
    return Response({"message": "Hello, world!"})


@csrf_exempt
def unit_detail(request, pk):
    """
    Retrieve, update or delete a code snippet.
    """
    try:
        unit = Unit.objects.get(pk=pk)
    except Unit.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = UnitSerializer(unit)
        return JSONResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = UnitSerializer(unit, data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data)
        return JSONResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        property.delete()
        return HttpResponse(status=204)