package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TemplateController {

	@GetMapping(value = "/progressDocument.do")
	public String ProgressDocumentList(Model model) {
		return "progressDocument";
	}
	
	@GetMapping(value = "/draftDocument.do")
	public String DraftedDocumentList() {
		return "drafted";
	}
	
	@GetMapping(value = "/templateList.do")
	public String TemplateList() {
		return "templateList";
	}
	
	@GetMapping(value = "/rejectedDocument.do")
	public String RejectedDocumentList() {
		return "rejectedDocumentList";
	}
	
	@GetMapping(value = "/referenceDocument.do")
	public String ReferenceDocumentList() {
		return "referenceDocumentList";
	}
	
	@GetMapping(value = "/completeDocument.do")
	public String CompleteDocumentList() {
		return "completeDocumentList";
	}
	
	@GetMapping(value = "/signDocument.do")
	public String SignDocumentList() {
		return "signDocumentList";
	}
	
	@GetMapping(value = "/recycleBin.do")
	public String RecycleBinList() {
		return "recycleBinList";
	}
	
	@GetMapping(value = "/temporaryDocumentList.do")
	public String TemporaryDocumentList() {
		return "temporaryDocumentList";
	}
	
	@GetMapping(value = "/writeTemplate.do")
	public String WriteTemplate() {
		return "writeTemplate";
	}
	
	
	
	
}
