const { Router } = require('express');
const { usuariosGet, 
        usuariosDelete, 
        usuariosPut, 
        usuariosPost, 
        usuariosPatch } = require('../controllers/users');

const router = Router();

// endpoint
router.get('/', usuariosGet );
  
router.put('/:id', usuariosPut );

router.post('/', usuariosPost);

router.delete('/', usuariosDelete);

router.patch('/', usuariosPatch);

module.exports = router;

