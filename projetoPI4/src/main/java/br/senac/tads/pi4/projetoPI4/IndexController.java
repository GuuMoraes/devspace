package br.senac.tads.pi4.projetoPI4;


import br.senac.tads.pi4.projetoPI4.curso.Curso;
import br.senac.tads.pi4.projetoPI4.curso.CursoRepositoryDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping()
public class IndexController {

    @GetMapping
    public ModelAndView listar(){

        List<Curso> listagem = new CursoRepositoryDAO().listarAtivos();

        ModelAndView mv = new ModelAndView("index");
        mv.addObject("lista", listagem);
        return mv;
    }

    @PostMapping()
    public ModelAndView buscar(@RequestParam("txtBuscar") String txtBuscar) {

        List<Curso> listagem = new CursoRepositoryDAO().listarNome(txtBuscar);
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("lista", listagem);
        return mv;
    }

}
