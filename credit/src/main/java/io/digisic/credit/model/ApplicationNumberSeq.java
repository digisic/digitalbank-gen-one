package io.digisic.credit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

@Entity
@SequenceGenerator(name="APP_NO_SEQ", initialValue=728934001, allocationSize=50)
public class ApplicationNumberSeq {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="APP_NO_SEQ")
	@Column(nullable=false, updatable=false, unique=true)
	@JsonProperty (access = Access.READ_ONLY)
	private Long id;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
}
