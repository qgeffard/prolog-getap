package org.ldv.sio.getap.app.test;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Date;

import org.junit.Before;
import org.junit.Test;
import org.ldv.sio.getap.app.AccPersonalise;
import org.ldv.sio.getap.app.Classe;
import org.ldv.sio.getap.app.DVCTAPException;
import org.ldv.sio.getap.app.DemandeValidationConsoTempsAccPers;
import org.ldv.sio.getap.app.User;

public class DemandeValidationConsoTempsAccPersTest {

	private DemandeValidationConsoTempsAccPers dvctap;

	@Before
	public void setUp() {
		Classe classe = new Classe(0, "SIO22");
		User prof = new User(0l, "Olivier", "Capuozzo", classe, "profPrin");
		User eleve = new User(1l, "Nizar", "Ben Ragdel", classe, "eleve");
		AccPersonalise accPers = new AccPersonalise(0, "Salon du libre", 0, 0l);

		Date date = Date.valueOf("2012-10-07");

		dvctap = new DemandeValidationConsoTempsAccPers(0l, "2012-2013", date,
				240, prof, accPers, eleve, 0);
	}

	@Test
	public void testEtatInitial() {
		try {

			assertTrue("Etat initial", dvctap.isEtatInitial());
		} catch (DVCTAPException e) {
			System.out.println(e); // à logger avec plus de détails ??
		}

	}

	@Test
	public void testModifieeEleve() {
		try {
			dvctap.modifieeParEleve();
			assertTrue("Etat modifié élève", dvctap.getEtat() == 4);
		} catch (DVCTAPException e) {
			System.out.println(e);
		}
	}

	@Test
	public void testValiderProfesseur() {
		try {
			dvctap.setEtat(0);
			dvctap.valideeParLeProfesseur();
			dvctap.modifieeParEleve();
			fail("Etat modifié élève");
		} catch (DVCTAPException e) {
			System.out.println(e); // a logger avec plus de détails ??
			assertTrue(1 == 1);
		}
	}

	@Test
	public void testRefuserProfesseur() {
		try {
			dvctap.setEtat(0);
			dvctap.refuseeParLeProfesseur();
			dvctap.modifieeParEleve();
			fail("Etat modifié élève");
		} catch (DVCTAPException e) {
			System.out.println(e);
			assertTrue(1 == 1);
		}
	}

	@Test
	public void testAnnulerEleve() {
		try {
			dvctap.setEtat(0);
			dvctap.modifieeParEleve();
			dvctap.annuleeParEleve();
			dvctap.modifieeParEleve();
			fail("Etat modifié élève");
		} catch (DVCTAPException e) {
			System.out.println(e);
			assertTrue(1 == 1);
		}
	}

	@Test
	public void testDiffPassageEtat() {
		try {
			dvctap.setEtat(0);
			dvctap.modifieeParEleve();
			dvctap.valideeParLeProfesseur();
			dvctap.modifieeParEleve();
			dvctap.modifieeDureeParLeProfesseur();
			dvctap.rejeteParEleve();
			dvctap.valideeParLeProfesseur();
			System.out.println(dvctap.getEtat());
			fail("Etat modifié élève");
		} catch (DVCTAPException e) {
			System.out.println(e);
			assertTrue(1 == 1);
		}
	}

}