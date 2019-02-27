package handle;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import entity.Departs;

public class DepartsHandle extends AbstractHandle {

	public DepartsHandle() {
		super(Departs.class);
	}
}
