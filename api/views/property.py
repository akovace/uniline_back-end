from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from uniappline.models import Property
from uniappline.serializers import PropertySerializer

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)


@csrf_exempt
def property_list(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        propertys = Property.objects.all()
        serializer = PropertySerializer(propertys, many=True)
        return JSONResponse(serializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = PropertySerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data, status=201)
        return JSONResponse(serializer.errors, status=400)


@csrf_exempt
def property_detail(request, pk):
    """
    Retrieve, update or delete a code snippet.
    """
    try:
        property = Property.objects.get(pk=pk)
    except Property.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = PropertySerializer(property)
        return JSONResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = PropertySerializer(property, data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data)
        return JSONResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        property.delete()
        return HttpResponse(status=204)