  
  <cfhtmltopdf destination="usage_example2.pdf"
  source="testpdf-svgsource.cfm" overwrite="true"  
  orientation="portrait"  pagetype="A4" margintop="1" marginbottom="1" 
  marginleft="1" marginright="1" />
 
<cfcontent file="#getdirectoryfrompath(getbasetemplatepath())#usage_example2.pdf" type="application/pdf" >