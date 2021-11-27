import 'package:cloudbase_database/src/geo/lineString.dart';
import 'package:cloudbase_database/src/geo/multiLineString.dart';
import 'package:cloudbase_database/src/geo/multiPoint.dart';
import 'package:cloudbase_database/src/geo/multiPolygon.dart';
import 'package:cloudbase_database/src/geo/point.dart';
import 'package:cloudbase_database/src/geo/polygon.dart';

class Geo {
  Point point(num longitude, num latitude) {
    return Point(longitude, latitude);
  }

  MultiPoint multiPoint(List<Point> points) {
    return new MultiPoint(points);
  }

  LineString lineString(List<Point> points) {
    return new LineString(points);
  }

  MultiLineString multiLineString(List<LineString> lines) {
    return new MultiLineString(lines);
  }

  Polygon polygon (List<LineString> lines) {
    return new Polygon(lines);
  }

  MultiPolygon multiPolygon (List<Polygon> polygons) {
    return new MultiPolygon(polygons);
  }
}