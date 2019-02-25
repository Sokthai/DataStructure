	<jsp:include page="header.jsp" />
	
	<!-- JSTL includes -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<!-- 	Just some stuff you need -->
	<header>
	  <div class="container">
	<!-- this "c:choose" is like switch statement in java  -->
	<c:choose> 
	<c:when test="${not empty message }">
	  <p class="alert ${messageClass}">${message }</p>
	<%
	  session.setAttribute("message", null);
	  session.setAttribute("messageClass", null);
	%>
	</c:when>
	</c:choose>
 
		<h1>eZoo <small>Update Feeding Schedule</small></h1>
		<hr class="paw-primary">
		
			<table class="table table-striped table-hover table-responsive ezoo-datatable">
				<thead>
					<tr>
						<th class="text-center" style="width: 100px">Schedule ID</th>
						<th class="text-center">Feeding Time</th>
						<th class="text-center">Recurrence</th>
						<th class="text-center">Food</th>
						<th class="text-center">Note</th>
						<th class="text-center">Update</th>
					
					</tr>
				</thead>
				<tbody>
				<!-- 
					the "\${unAssignedAnimals }" is come from session that i assign from AssignFeddingScheduleServlet 
					and the var="unAssignedAnimal" is the each object from "$\{unAssignedAnimals}". 
					Note: because this is JSP looping style. read JSP only for detail
					AWARENESS:
					the "animal_id" from database is changed to "animalID" and "taxkingdom" to "taxKingdom" 
					due to JSP style
				 -->
					<c:forEach var="FeedingSchedule" items="${FeedingSchedules}">
						<tr>
							<td><c:out value="${FeedingSchedule.scheduleID}" /></td> <!-- must use animalID instead of animal_id -->
							<td><c:out value="${FeedingSchedule.feedingTime}" /></td>
							<td><c:out value="${FeedingSchedule.recurrence}" /></td>
							<td><c:out value="${FeedingSchedule.food}" /></td>
							<td style="text-align: left"><c:out value="${FeedingSchedule.note}" /></td>
							<td><a href="updateFeedingSchedule?id=<c:out value="${FeedingSchedule.scheduleID}" />">Update</a></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>	
		  	</div>
							
					
		
		
	  </div>
	</header>
	
	

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
