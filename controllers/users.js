const { response, request } = require('express');

const usuariosGet = (req = request, res = response)=>{
    const { q, nombre = 'no name', apiKey, page = 1, limit } = req.query;
    res.json({
        msg:'get api - controller',
        q,
        nombre,
        apiKey,
        page,
        limit
    });
}

const usuariosPut = (req, res = response)=>{
    const { id } = req.params;
    res.json({
        msg:'put api - controller',
        id: id
    });
}

const usuariosPost = (req, res = response)=>{
    const { name, age} = req.body;

    res.json({
        msg:'post api - controller',
        name,
        age
    });
}

const usuariosDelete = (req, res = response)=>{
    
    res.json({
        msg:'delete api - controller'
    });
}

const usuariosPatch = (req, res = response)=>{
    
    res.json({
        msg:'patch api - controller'
    });
}

module.exports = {
    usuariosGet,
    usuariosPut,
    usuariosPost,
    usuariosDelete,
    usuariosPatch
}
