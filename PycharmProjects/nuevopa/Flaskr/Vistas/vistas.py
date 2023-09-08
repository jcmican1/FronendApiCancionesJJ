from flask_restful import Resource
from ..Modelos import db, Cancion, CancionSchema,Album, AlbumSchema, Usuario, UsuarioSchema, AlbumCancion, AlbumCancionSchema
from flask import request

cancion_schema = CancionSchema()
album_schema = AlbumSchema()
usuario_schema = UsuarioSchema()
album_cancion_schema = AlbumCancionSchema()


class VistaCanciones(Resource):
    def get(self):
        canciones = Cancion.query.all()
        return [cancion_schema.dump(cancion) for cancion in canciones]

    def post(self):
        nueva_cancion = Cancion(
            titulo=request.json['titulo'],
            minutos=request.json['minutos'],
            segundos=request.json['segundos'],
            interprete=request.json['interprete']
        )
        db.session.add(nueva_cancion)
        db.session.commit()
        return cancion_schema.dump(nueva_cancion)

class VistaCancion(Resource):
    def get(self, id_cancion):
        cancion = Cancion.query.get_or_404(id_cancion)
        return cancion_schema.dump(cancion)

    def put(self, id_cancion):
        cancion = Cancion.query.get_or_404(id_cancion)
        cancion.titulo = request.json.get('titulo', cancion.titulo)
        cancion.minutos = request.json.get('minutos', cancion.minutos)
        cancion.segundos = request.json.get('segundos', cancion.segundos)
        cancion.interprete = request.json.get('interprete', cancion.interprete)
        db.session.commit()
        return cancion_schema.dump(cancion)

    def delete(self, id_cancion):
        cancion = Cancion.query.get_or_404(id_cancion)
        db.session.delete(cancion)
        db.session.commit()
        return 'Operación exitosa', 204


class VistaAlbumes(Resource):
    def get(self):
        albumes = Album.query.all()
        return [album_schema.dump(album) for album in albumes]

    def post(self):
        nuevo_album = Album(
            titulo=request.json['titulo'],
            anio=request.json['anio'],
            descripcion=request.json['descripcion'],
            medio=request.json['medio'],
            usuario_id=request.json['usuario_id']
        )
        db.session.add(nuevo_album)
        db.session.commit()
        return album_schema.dump(nuevo_album)

class VistaAlbum(Resource):
    def get(self, id_album):
        album = Album.query.get_or_404(id_album)
        return album_schema.dump(album)

    def put(self, id_album):
        album = Album.query.get_or_404(id_album)
        album.titulo = request.json.get('titulo', album.titulo)
        album.anio = request.json.get('anio', album.anio)
        album.descripcion = request.json.get('descripcion', album.descripcion)
        album.medio = request.json.get('medio', album.medio)
        db.session.commit()
        return album_schema.dump(album)

    def delete(self, id_album):
        album = Album.query.get_or_404(id_album)
        db.session.delete(album)
        db.session.commit()
        return 'Operación exitosa', 204

class VistaUsuarios(Resource):
    def get(self):
        usuarios = Usuario.query.all()
        return [usuario_schema.dump(usuario) for usuario in usuarios]

    def post(self):
        nuevo_usuario = Usuario(
            nombre=request.json['nombre'],
            contrasena=request.json['contrasena']
        )
        db.session.add(nuevo_usuario)
        db.session.commit()
        return usuario_schema.dump(nuevo_usuario)

class VistaUsuario(Resource):
    def get(self, id_usuario):
        usuario = Usuario.query.get_or_404(id_usuario)
        return usuario_schema.dump(usuario)

    def put(self, id_usuario):
        usuario = Usuario.query.get_or_404(id_usuario)
        usuario.nombre = request.json.get('nombre', usuario.nombre)
        usuario.contrasena = request.json.get('contrasena', usuario.contrasena)
        db.session.commit()
        return usuario_schema.dump(usuario)

    def delete(self, id_usuario):
        usuario = Usuario.query.get_or_404(id_usuario)
        db.session.delete(usuario)
        db.session.commit()
        return 'Operación exitosa', 204


class VistaAlbumesCanciones(Resource):
    def get(self):
        query = db.session.query(AlbumCancion, Album, Cancion). \
            join(Album, AlbumCancion.album_id == Album.id). \
            join(Cancion, AlbumCancion.cancion_id == Cancion.id). \
            all()
        results = []
        for album_cancion, album, cancion in query:
            result = {
                'album_id': album_cancion.album_id,
                'cancion_id': album_cancion.cancion_id,
                'album_titulo': album.titulo,
                'cancion_titulo': cancion.titulo,
            }
            results.append(result)
        return results

    def post(self):
        nuevo_album_cancion = AlbumCancion(
            album_id=request.json['album_id'],
            cancion_id=request.json['cancion_id']
        )
        db.session.add(nuevo_album_cancion)
        db.session.commit()
        return album_cancion_schema.dump(nuevo_album_cancion)

class VistaAlbumCancion(Resource):

    def get(self, album_id, cancion_id):
        album_cancion_data = db.session.query(AlbumCancion, Album, Cancion). \
            join(Album, AlbumCancion.album_id == Album.id). \
            join(Cancion, AlbumCancion.cancion_id == Cancion.id). \
            filter(AlbumCancion.album_id == album_id, AlbumCancion.cancion_id == cancion_id).first()

        if album_cancion_data is None:
            return {"message": "La tupla no existe"}, 404

        album_cancion, album, cancion = album_cancion_data
        response_data = {
            'album_id': album_cancion.album_id,
            'cancion_id': album_cancion.cancion_id,
            'album_titulo': album.titulo,
            'cancion_titulo': cancion.titulo,
        }
        return response_data

    def put(self, id_album_cancion):
        album_cancion = AlbumCancion.query.get_or_404(id_album_cancion)

        # Actualizar los datos del registro album_cancion
        album_cancion.album_id = request.json.get('album_id', album_cancion.album_id)
        album_cancion.cancion_id = request.json.get('cancion_id', album_cancion.cancion_id)

        db.session.commit()
        return album_cancion_schema.dump(album_cancion)

    def delete(self, id_album_cancion):
        album_cancion = AlbumCancion.query.get_or_404(id_album_cancion)

        # Eliminar el registro album_cancion
        db.session.delete(album_cancion)
        db.session.commit()

        return 'Operación exitosa', 204