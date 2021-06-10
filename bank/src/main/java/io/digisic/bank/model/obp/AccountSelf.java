package io.digisic.bank.model.obp;

import java.util.List;

public class AccountSelf {
	
	private String id;
	private Routing bank_routing;
	private List<Routing> account_routings;
	private List<Holder> holders;
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the bank_routing
	 */
	public Routing getBank_routing() {
		return bank_routing;
	}
	/**
	 * @param bank_routing the bank_routing to set
	 */
	public void setBank_routing(Routing bank_routing) {
		this.bank_routing = bank_routing;
	}
	/**
	 * @return the account_routings
	 */
	public List<Routing> getAccount_routings() {
		return account_routings;
	}
	/**
	 * @param account_routings the account_routings to set
	 */
	public void setAccount_routings(List<Routing> account_routings) {
		this.account_routings = account_routings;
	}
	/**
	 * @return the holders
	 */
	public List<Holder> getHolders() {
		return holders;
	}
	/**
	 * @param holders the holders to set
	 */
	public void setHolders(List<Holder> holders) {
		this.holders = holders;
	}

}
