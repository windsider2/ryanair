package app.perf

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class TodoSimulation extends Simulation {

  Utils.startServer()

  val protocol = karateProtocol(
    "/user" -> Nil
  )

  val main = scenario("main").exec(karateFeature("classpath:app/examples/user/create-user.feature"))
  val updateUser = scenario("UpdateUser").exec(karateFeature("classpath:app/examples/user/retrieve-all-users.feature"))

  setUp(
    main.inject(rampUsers(1000) during (1 seconds)).protocols(protocol),
      updateUser.inject(rampUsers(1000) during (1 seconds)).protocols(protocol)
  )

}