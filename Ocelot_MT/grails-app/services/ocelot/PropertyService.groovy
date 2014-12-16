package ocelot

import grails.converters.JSON
import grails.transaction.Transactional
import org.camunda.bpm.model.bpmn.Bpmn
import org.camunda.bpm.model.bpmn.BpmnModelInstance
import org.camunda.bpm.model.bpmn.impl.BpmnModelConstants
import org.codehaus.groovy.grails.web.json.JSONArray

@Transactional
class PropertyService {

	def injectAttributes(xmlBpmn2, jsonString) {

		def node
		def jsonFieldKey
		def jsonAttributes = JSON.parse(jsonString)
		BpmnModelInstance modelInstance = Bpmn.readModelFromStream(new ByteArrayInputStream(xmlBpmn2.getBytes("UTF-8")))

		int i = 0

		while(i < jsonAttributes.size()) {

			jsonFieldKey = jsonAttributes.keys()[i]
			JSONArray jsonArray = jsonAttributes.get(jsonFieldKey)
			node = modelInstance.getModelElementById(jsonFieldKey)

			for (int z = 0; z < jsonArray.size(); z++) {

				if(!jsonArray[z].value.toString().empty && node != null) {

					if(!jsonArray[z].extension.equals("camunda"))
						node.setAttributeValue(jsonArray[z].name, jsonArray[z].value.toString())
					else
						node.setAttributeValueNs(BpmnModelConstants.CAMUNDA_NS, jsonArray[z].name, jsonArray[z].value.toString())
				}
			}
			i++
		}

		Bpmn.convertToString(modelInstance)
	}
}
