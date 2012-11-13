package org.ldv.sio.getap.web;

import javax.servlet.http.HttpServletRequest;

import org.ldv.sio.getap.app.AccPersonalise;
import org.ldv.sio.getap.app.DemandeValidationConsoTempsAccPers;
import org.ldv.sio.getap.app.FormListConsoForProfInter;
import org.ldv.sio.getap.app.FormListIdDctap;
import org.ldv.sio.getap.app.User;
import org.ldv.sio.getap.app.service.IFManagerGeTAP;
import org.ldv.sio.getap.utils.UtilSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Web controller for prof-intervenant related actions.
 */
@Controller
@RequestMapping("/prof-intervenant/*")
public class ProfInterController {

	@Autowired
	@Qualifier("DBServiceMangager")
	private IFManagerGeTAP manager;

	public void setManagerEleve(IFManagerGeTAP serviceManager) {
		this.manager = serviceManager;
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String editDCTAPById(@RequestParam("id") String id,
			FormListConsoForProfInter dctap, Model model) {

		System.out.println("TEST id recu :" + dctap.getId());

		model.addAttribute("lesAP", manager.getAllAPForProf());

		DemandeValidationConsoTempsAccPers currentDctap = manager
				.getDVCTAPById(Long.valueOf(id));
		if (currentDctap.isEtatInitial() || currentDctap.isModifieeEleve()
				|| currentDctap.isModifieeApProf()
				|| currentDctap.isModifieeDateProf()
				|| currentDctap.isModifieeDureeProf()) {
			// valorise le bean de vue avec le dctap courant
			dctap.setId(currentDctap.getId()); // en provenance d'un champ caché
			dctap.setDateAction(currentDctap.getDateAction());
			dctap.setMinutes(currentDctap.getMinutes());
			model.addAttribute("minute", currentDctap.getMinutes());
			dctap.setAccPersId(currentDctap.getAccPers().getId());

			return "prof-intervenant/edit";
		}
		return "prof-intervenant/index";
	}

	/**
	 * Default action, displays the use case page.
	 * 
	 * 
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public void index(Model model) {
		User me = UtilSession.getUserInSession();
		model.addAttribute("listdctaps", manager.getAllDVCTAPByProfInterv(me));
		Long id = me.getId();
		model.addAttribute("INITIAL", manager.getAllDVCTAPByEtat(0, id));
		model.addAttribute("ACCEPTEE_ELEVE", manager.getAllDVCTAPByEtat(1, id));
		model.addAttribute("REJETEE_ELEVE", manager.getAllDVCTAPByEtat(2, id));
		model.addAttribute("MODIFIEE_ELEVE", manager.getAllDVCTAPByEtat(4, id));
		model.addAttribute("ANNULEE_ELEVE", manager.getAllDVCTAPByEtat(8, id));
		model.addAttribute("VALIDEE_PROF", manager.getAllDVCTAPByEtat(32, id));
		model.addAttribute("REFUSEE_PROF", manager.getAllDVCTAPByEtat(64, id));
		model.addAttribute("MODIFPROF", manager.getAllDVCTAPModifByEtat(id));

	}

	@RequestMapping(value = "doedit", method = RequestMethod.POST)
	public String doeditDCTAPById(FormListConsoForProfInter formDctap,
			BindingResult bindResult, Model model) {
		System.out.println("TEST :" + formDctap.getId());
		System.out.println("TEST :" + model);

		if (bindResult.hasErrors())
			return "prof-intervenant/edit";
		else {

			DemandeValidationConsoTempsAccPers dctapForUpdate = manager
					.getDVCTAPById(Long.valueOf(formDctap.getId()));

			AccPersonalise acc = manager.getAPById(formDctap.getAccPersId());
			String accPersNom = acc.getNom();

			if (!dctapForUpdate.getDateAction().equals(
					formDctap.getDateAction())
					&& !dctapForUpdate.isModifieeDateProf()) {
				dctapForUpdate.modifieeDateParLeProfesseur();
			}
			if (!dctapForUpdate.getMinutes().equals(formDctap.getMinutes())
					&& !dctapForUpdate.isModifieeDureeProf()) {
				dctapForUpdate.modifieeDureeParLeProfesseur();
			}
			if (!dctapForUpdate.getAccPers().getNom().equals(accPersNom)
					&& !dctapForUpdate.isModifieeApProf()) {
				dctapForUpdate.modifieeAPParLeProfesseur();
			}

			dctapForUpdate.setDateAction(formDctap.getDateAction());
			dctapForUpdate.setMinutes(formDctap.getMinutes());
			dctapForUpdate.setAccPers(manager.getAPById(formDctap
					.getAccPersId()));

			manager.updateDVCTAP(dctapForUpdate);

			return "redirect:/app/prof-intervenant/index";
		}
	}

	@RequestMapping(value = "refuse/{id}", method = RequestMethod.GET)
	public String refuseDCTAPById(@PathVariable String id, Model model) {
		DemandeValidationConsoTempsAccPers dctap = manager.getDVCTAPById(Long
				.valueOf(id));

		// Test que la DCTAP appartient à la bonne personne
		if (dctap.getProf().equals(UtilSession.getUserInSession())
				&& (dctap.isEtatInitial() || dctap.isModifieeEleve()
						|| dctap.isModifieeApProf()
						|| dctap.isModifieeDateProf() || dctap
							.isModifieeDureeProf())) {
			dctap.refuseeParLeProfesseur();
			manager.updateDVCTAP(dctap);
		}

		return "redirect:/app/prof-intervenant/index";
	}

	@RequestMapping(value = "valid/{id}", method = RequestMethod.GET)
	public String validDCTAPById(@PathVariable String id, Model model) {
		DemandeValidationConsoTempsAccPers dctap = manager.getDVCTAPById(Long
				.valueOf(id));

		// Test que la DCTAP appartient à la bonne personne
		if (dctap.getProf().equals(UtilSession.getUserInSession())
				&& (dctap.isEtatInitial() || dctap.isModifieeEleve())) {
			dctap.valideeParLeProfesseur();
			manager.updateDVCTAP(dctap);
		}

		return "redirect:/app/prof-intervenant/index";
	}

	@RequestMapping(value = "sendId", method = RequestMethod.POST)
	public String listIdDctap(Model model, HttpServletRequest request,
			FormListIdDctap listId) {
		if (listId.getIds() == null) {
			return "redirect:/app/prof-intervenant/index";
		}

		for (int i = 0; i < listId.getIds().length; i++) {
			if (request.getParameter("send").equals("Valider")) {
				this.validDCTAPById(listId.getIds()[i], model);
			} else {
				this.refuseDCTAPById(listId.getIds()[i], model);
			}
		}

		return "redirect:/app/prof-intervenant/index";
	}
}
