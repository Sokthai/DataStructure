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
 
		<h1>eZoo <small>Assign Feeding Schedule</small></h1>
		<hr class="paw-primary">
		<form method="post" action="assignFeedingSchedule">
		
			<table class="table table-striped table-hover table-responsive ezoo-datatable">
				<thead>
					<tr>
						<th class="text-center" style="width: 100px">Animal ID</th>
						<th class="text-center">Animal</th>
						<th class="text-center">Feeding Schedule</th>
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
					<c:forEach var="unAssignedAnimal" items="${unAssignedAnimals}">
						<tr>
							<td><c:out value="${unAssignedAnimal.animalID}" /></td> <!-- must use animalID instead of animal_id -->
							<td><c:out value="${unAssignedAnimal.name}" /></td>
							<td>
							<select required="required" name="schedule" class="form-control">
								<c:forEach var="feedingSchedule" items="${feedingSchedules}">	
								<!-- Assigning scheduleID and AnimalID together in option value for AssignFeedingScheduleServlet to retrieve -->
									<option value="${feedingSchedule.scheduleID},${unAssignedAnimal.animalID}">
										${feedingSchedule.feedingTime}
										${feedingSchedule.recurrence}-
										${feedingSchedule.food}-
										${feedingSchedule.note}
									</option>
								</c:forEach>
								</select>
							</td>
						</tr>
					</c:forEach>
					
					
					
				</tbody>
			</table>	
				<div class="form-group">
		    	<div class="col-sm-1">
		      		<button type="submit" class="btn btn-primary">Assign Schedule</button>
		    	</div>
		  	</div>
							
					
		
		</form>
	  </div>
	</header>
	
	

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
