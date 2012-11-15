package org.ldv.sio.getap.app;

import java.sql.Date;

/**
 * Demande de validation d'un temps d'accompagnement personnalisé
 * 
 * Commit pour tuto
 */

public class DemandeValidationConsoTempsAccPers {
	private static final int INITIAL = 0;
	private static final int ACCEPTEE_ELEVE = 1;
	private static final int REJETEE_ELEVE = 2;
	private static final int MODIFIEE_ELEVE = 4;
	private static final int ANNULEE_ELEVE = 8;
	private static final int VALIDEE_PROF = 32;
	private static final int REFUSEE_PROF = 64;
	private static final int FIN_VIE = 128;
	private static final int DATE_MODIFIEE = 1024;
	private static final int DUREE_MODIFIEE = 2048;
	private static final int AP_MODIFIEE = 4096;

	/**
	 * Identifiant de la DCTAP
	 */
	private Long id;
	/**
	 * Année scolaire de la demande, par exemple "2011-2012"
	 */
	private String anneeScolaire;
	/**
	 * Date de réalisation de l'accompagnement
	 * 
	 */
	private java.sql.Date dateAction;
	/**
	 * Nombre de minutes d'accompagnement personnalisé à valider
	 */
	private Integer minutes;
	/**
	 * Professeur ayant assuré l'accompagnement personnalisé
	 */
	private User prof;
	/**
	 * Nature de l'accompagnement personnalisé associé à la demande
	 */
	private AccPersonalise accPers;
	/**
	 * Identifiant de l'élève ayant réalisé l'accompagnement personnalisé
	 */
	private User eleve;

	/**
*
*/
	private int etat;

	/**
	 * constructeur par défaut
	 */
	public DemandeValidationConsoTempsAccPers() {

	}

	/**
	 * Constructeur permettant de créer une demande complète.
	 * 
	 * @param id
	 *            peut être null (moment de la creation)
	 * 
	 * @param anneeScolaire
	 * @param date
	 * @param minutes
	 * @param prof
	 * @param accPers
	 * @param eleve
	 * @param etat
	 */
	public DemandeValidationConsoTempsAccPers(Long id, String anneeScolaire,
			Date date, Integer minutes, User prof, AccPersonalise accPers,
			User eleve, int etat) {
		super();
		this.id = id;
		this.anneeScolaire = anneeScolaire;
		this.dateAction = date;
		this.minutes = minutes;
		this.prof = prof;
		this.accPers = accPers;
		this.eleve = eleve;
		this.etat = etat;
	}

	// isser

	/**
	 * Test si l'état est initial
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isEtatInitial() {
		return this.etat == INITIAL;
	}

	/**
	 * Test si l'état est validé par le professeur
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isValideeProf() {
		return (this.etat & VALIDEE_PROF) != 0;
	}

	/**
	 * Test si l'état est refusé par le professeur
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isRefuseeProf() {
		return (this.etat & REFUSEE_PROF) != 0;
	}

	/**
	 * Test si l'état est annulé par l'élève
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isAnnuleeEleve() {
		return (this.etat & ANNULEE_ELEVE) != 0;
	}

	/**
	 * Test si l'état est modifié par l'élève
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isModifieeEleve() {
		return (this.etat & MODIFIEE_ELEVE) != 0;
	}

	/**
	 * Test si l'état est accepté par l'élève
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isAccepteeEleve() {
		return (this.etat & ACCEPTEE_ELEVE) != 0;
	}

	/**
	 * Test si l'état est rejeté par l'élève
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isRejeteeEleve() {
		return (this.etat & REJETEE_ELEVE) != 0;
	}

	/**
	 * Test si l'état du bit sur la date est modifié par le professeur
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isModifieeDateProf() {
		return (this.etat & DATE_MODIFIEE) != 0;
	}

	/**
	 * Test si l'état du bit sur la durée est modifié par le professeur
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isModifieeDureeProf() {
		return (this.etat & DUREE_MODIFIEE) != 0;
	}

	/**
	 * Test si l'état du bit sur l'AP est modifié par le professeur
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isModifieeApProf() {
		return (this.etat & AP_MODIFIEE) != 0;
	}

	/**
	 * Test si la demande est en fin de vie
	 * 
	 * @return un booléen correspondant à cet état
	 */
	public boolean isFinDeVie() {
		return (this.etat & FIN_VIE) != 0;
	}

	// getter/setter

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAnneeScolaire() {
		return anneeScolaire;
	}

	public void setAnneeScolaire(String anneeScolaire) {
		this.anneeScolaire = anneeScolaire;
	}

	public java.sql.Date getDateAction() {
		return dateAction;
	}

	public void setDateAction(java.sql.Date date) {
		this.dateAction = date;
	}

	public Integer getMinutes() {
		return minutes;
	}

	public void setMinutes(Integer minutes) {
		this.minutes = minutes;
	}

	public User getProf() {
		return prof;
	}

	public void setProf(User prof) {
		this.prof = prof;
	}

	public AccPersonalise getAccPers() {
		return accPers;
	}

	public void setAccPers(AccPersonalise accPers) {
		this.accPers = accPers;
	}

	public User getEleve() {
		return eleve;
	}

	public void setEleve(User eleve) {
		this.eleve = eleve;
	}

	public int getEtat() {
		return etat;
	}

	/**
	 * Permet de modifier l'état de la demande
	 * 
	 * @param etat
	 *            prend ses valeur dans :
	 *            <ul>
	 *            <li>0 - demande créée par l'élève</li>
	 *            <li>1 - demande acceptée par l'élève aprés modification du
	 *            professeur</li>
	 *            <li>2 - demande rejetée par l'élève aprés modification du
	 *            professeur</li>
	 *            <li>4 - demande modifiée par l'élève</li>
	 *            <li>8 - demande annulée par l'élève</li>
	 *            <li>32 - demande validée par le professeur</li>
	 *            <li>64 - demande refusée par le professeur</li>
	 *            <li>1024 - demande où la date a été modifiée par le professeur
	 *            </li>
	 *            <li>2048 - demande où la durée a été modifiée par le
	 *            professeur</li>
	 *            <li>4096 - demande où l'accompagnement personnalisé a été
	 *            modifiée par le professeur</li>
	 *            </ul>
	 */
	public void setEtat(int etat) {
		this.etat = etat;
	}

	// Méthodes

	public String errorReporting() {
		String str = "";
		if (this.isAnnuleeEleve())
			str = "La demande a déjà été annulée par l'élève";
		else if (this.isRefuseeProf())
			str = "La demande a déjà été refusée par le professeur";
		else if (this.isAccepteeEleve())
			str = "La demande a déjà été acceptée par l'élève";
		else if (this.isRejeteeEleve())
			str = "La demande a déjà été rejetée par l'élève";
		else if (this.isValideeProf())
			str = "La demande a déjà été validée par le professeur";
		else if (this.isModifieeApProf() || this.isModifieeDateProf()
				|| this.isModifieeDureeProf())
			str = "La demande a déjà été modifiée par le professeur";
		else if (this.isModifieeEleve())
			str = "La demande a déjà été modifiée par l'élève";

		return str;
	}

	/**
	 * Lève le bit de validation par le professeur en fonction de l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void valideeParLeProfesseur() throws DVCTAPException {
		if (!this.isAnnuleeEleve() && !this.isRefuseeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isValideeProf()) {
			this.etat = this.etat | VALIDEE_PROF;
			this.etat = this.etat | FIN_VIE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit de refus par le professeur en fonction de l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void refuseeParLeProfesseur() throws DVCTAPException {
		if (!this.isAnnuleeEleve() && !this.isValideeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isRefuseeProf()) {
			this.etat = this.etat | REFUSEE_PROF;
			this.etat = this.etat | FIN_VIE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit d'annulation par l'élève en fonction de l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void annuleeParEleve() throws DVCTAPException {
		if (!this.isValideeProf() && !this.isRefuseeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isModifieeApProf() && !this.isModifieeDureeProf()
				&& !this.isModifieeDateProf() && !this.isAnnuleeEleve()) {
			this.etat = this.etat | ANNULEE_ELEVE;
			this.etat = this.etat | FIN_VIE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit de modification par l'élève en fonction de l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void modifieeParEleve() throws DVCTAPException {
		if (!this.isValideeProf() && !this.isRefuseeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isModifieeApProf() && !this.isModifieeDureeProf()
				&& !this.isModifieeDateProf() && !this.isAnnuleeEleve()) {
			this.etat = this.etat | MODIFIEE_ELEVE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit de modification de la date par le professeur en fonction de
	 * l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void modifieeDateParLeProfesseur() throws DVCTAPException {
		if (!this.isValideeProf() && !this.isRefuseeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isAnnuleeEleve() && !this.isRefuseeProf()
				&& !this.isValideeProf()) {
			this.etat = this.etat | DATE_MODIFIEE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit de modification de la durée par le professeur en fonction de
	 * l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void modifieeDureeParLeProfesseur() throws DVCTAPException {
		if (!this.isValideeProf() && !this.isRefuseeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isAnnuleeEleve() && !this.isRefuseeProf()
				&& !this.isValideeProf()) {
			this.etat = this.etat | DUREE_MODIFIEE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit de modification de l'AP par le professeur en fonction de
	 * l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void modifieeAPParLeProfesseur() throws DVCTAPException {
		if (!this.isValideeProf() && !this.isRefuseeProf()
				&& !this.isAccepteeEleve() && !this.isRejeteeEleve()
				&& !this.isAnnuleeEleve() && !this.isRefuseeProf()
				&& !this.isValideeProf()) {
			this.etat = this.etat | AP_MODIFIEE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit de rejet par l'élève en fonction de l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void rejeteParEleve() throws DVCTAPException {
		if (!this.isValideeProf()
				&& !this.isRefuseeProf()
				&& !this.isAccepteeEleve()
				&& !this.isAnnuleeEleve()
				&& !this.isRefuseeProf()
				&& !this.isValideeProf()
				&& !this.isRejeteeEleve()
				&& (this.isModifieeApProf() || this.isModifieeDateProf() || this
						.isModifieeDureeProf())) {
			this.etat = this.etat | REJETEE_ELEVE;
			this.etat = this.etat | FIN_VIE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	/**
	 * Lève le bit d'acceptation par l'élève en fonction de l'état en cour
	 * 
	 * @throws DVCTAPException
	 */
	public void accepteeParEleve() throws DVCTAPException {
		if (!this.isValideeProf()
				&& !this.isRefuseeProf()
				&& !this.isRejeteeEleve()
				&& !this.isAnnuleeEleve()
				&& !this.isRefuseeProf()
				&& !this.isValideeProf()
				&& !this.isAccepteeEleve()
				&& (this.isModifieeApProf() || this.isModifieeDateProf() || this
						.isModifieeDureeProf())) {
			this.etat = this.etat | ACCEPTEE_ELEVE;
			this.etat = this.etat | FIN_VIE;
		} else {
			throw new DVCTAPException(errorReporting());
		}
	}

	@Override
	public String toString() {
		return "DemandeConsoTempsAccPers [id=" + id + ", anneeScolaire="
				+ anneeScolaire + ", dateAction=" + dateAction + ", minutes="
				+ minutes + ", prof=" + prof + ", accPers=" + accPers
				+ ", eleve=" + eleve + ", etat=" + etat + "]";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DemandeValidationConsoTempsAccPers other = (DemandeValidationConsoTempsAccPers) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}